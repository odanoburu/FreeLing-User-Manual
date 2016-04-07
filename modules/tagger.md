# Part-of-Speech Tagger Module {#part-of-speech-tagger-module}

There are two different modules able to perform PoS tagging. The application should decide which method is to be used, and instantiate the right class.

The first PoS tagger is the <tt>hmm_tagger</tt> class, which is a classical trigam Markovian tagger, following [Bra00].

The second module, named <tt>relax_tagger</tt>, is a hybrid system capable to integrate statistical and hand-coded knowledge, following [Pad98].

The <tt>hmm_tagger</tt> module is somewhat faster than <tt>relax_tagger</tt>, but the later allows you to add manual constraints to the model. Its API is the following:

```C++
class hmm_tagger: public POS_tagger {
  public:
    /// Constructor
    hmm_tagger(const std::string &hmmfile, 
               bool retok, 
               unsigned int force, 
               unsigned int kb=1);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;

    /// given an analyzed sentence find out probability 
    /// of the k-th best sequence
    double SequenceProb_log(const sentence &s, int k=0) const;
};
```

The <tt>hmm_tagger</tt> constructor receives the following parameters:

*   The HMM file, which containts the model parameters. The format of the file is described below. This file can be generated from a tagged corpus using the script <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt> provided in FreeLing package. See <tt>src/utilities/train-tagger/README</tt> to find out the details.
*   A boolean stating whether words that carry retokenization information (e.g. set by the dictionary or affix handling modules) must be retokenized (that is, splitted in two or more words) after the tagging.
*   An integer stating whether and when the tagger must select only one analysis in case of ambiguity. Possbile values are: <tt>FORCE_NONE (or 0)</tt>: no selection forced, words ambiguous after the tagger, remain ambiguous. <tt>FORCE_TAGGER (or 1)</tt>: force selection immediately after tagging, and before retokenization. <tt>FORCE_RETOK (or 2)</tt>: force selection after retokenization.
*   An integer stating how many best tag sequences the tagger must try to compute. If not specified, this parameter defaults to 1. Since a sentence may have less possible tag sequences than the given <tt>k</tt> value, the results may contain a number of sequences smaller than <tt>k</tt>.

The <tt>relax_tagger</tt> module can be tuned with hand written constraint, but is about 2 times slower than <tt>hmm_tagger</tt>. It is not able to produce <tt>k</tt> best sequences either.

```C++
class relax_tagger : public POS_tagger {
  public:
    /// Constructor, given the constraint file and config parameters
    relax_tagger(const std::string &cfgfile, 
                 int m, 
                 double f, 
                 double r, 
                 bool retok, 
                 unsigned int force);

    /// analyze given sentence.
    void analyze(sentence &s) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &ls) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &s) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The <tt>relax_tagger</tt> constructor receives the following parameters:

*   The constraint file. The format of the file is described below. This file can be generated from a tagged corpus using the script <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt> provided in FreeLing package. See <tt>src/utilities/train-tagger/README</tt> for details.
*   An integer <tt>m</tt> stating the maximum number of iterations to wait for convergence before stopping the disambiguation algorithm.
*   A real number <tt>f</tt> representing the scale factor of the constraint weights.
*   A real number <tt>r</tt> representing the threshold under which any changes will be considered too small. Used to detect convergence.
*   A boolean <tt>retok</tt> stating whether words that carry retokenization information (e.g. set by the dictionary or affix handling modules) must be retokenized (that is, splitted in two or more words) after the tagging.
*   An integer <tt>force</tt> stating whether and when the tagger must select only one analysis in case of ambiguity. Possbile values are: <tt>FORCE_NONE (or 0)</tt>: no selection forced, words ambiguous after the tagger, remain ambiguous. <tt>FORCE_TAGGER (or 1)</tt>: force selection immediately after tagging, and before retokenization. <tt>FORCE_RETOK (or 2)</tt>: force selection after retokenization.

The iteration number, scale factor, and threshold parameters are very specific of the relaxation labelling algorithm. Refer to [Pad98] for details.

## HMM-Tagger Parameter File {#hmm-tagger-parameter-file}

This file contains the statistical data for the Hidden Markov Model, plus some additional data to smooth the missing values. Initial probabilities, transition probabilities, lexical probabilities, etc.

The file may be generated by your own means, or using a tagged corpus and the training script provided in FreeLing package: <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt>.

See <tt>src/utilities/train-tagger/README</tt> for details.

The file has eight sections which contain -among other things- the paremeters of the HMM (e.g. the tag (unigram), bigram, and trigram probabilities used in Linear Interpolation smoothing by the tagger to compute state transition probabilities ( _α_<sub>ij</sub> parameters of the HMM):

*   Section `<TagsetFile>`. This section contains a single line with the path to a tagset description file (see section

    5.1

    ) to be used when computing short versions for PoS tags. If the path is relative, the location of the lexical probabilities file is used as the base directory.

    This section has to appear before section `<Forbidden>`.

*   Section `<Tag>`. List of unigram tag probabilities (estimated via your preferred method). Each line is a tag probability <tt>P(t)</tt> with format <tt>Tag Probability</tt>

    Lines for zero tag (for initial states) and for <tt>x</tt> (unobserved tags) must be included.

    E.g. <tt>0 0.03747</tt> <tt>AQ 0.00227</tt> <tt>NC 0.18894</tt> <tt>x 1.07312e-06</tt>

*   Section `<Bigram>`. List of bigram transition probabilities (estimated via your preferred method). Each line is a transition probability, with the format: <tt>Tag1.Tag2 Probability</tt>

    Tag zero indicates sentence-beggining.

    E.g. the following line indicates the transition probability between a sentence start and the tag of the first word being <tt>AQ</tt>. <tt>0.AQ 0.01403</tt>

    E.g. the following line indicates the transition probability between two consecutive tags. <tt>AQ.NC 0.16963</tt>

*   Section `<Trigram>`. List of trigram transition probabilities (estimated via your preferred method). Each line is a transition probability, with the format: <tt>Tag1.Tag2.Tag3 Probability</tt>.

    Tag zero indicates sentence-beggining.

    E.g. the following line indicates the probability that a word has <tt>NC</tt> tag just after a <tt>0.AQ</tt> sequence. <tt>0.AQ.NC 0.204081</tt>

    E.g. the following line indicates the probability of a tag <tt>SP</tt> appearing after two words tagged <tt>DA</tt> and <tt>NC</tt>. <tt>DA.NC.SP 0.33312</tt>

*   Section `<Initial>`. List of initial state probabilities (estimated via your preferred method), i.e. the _π_<sub>i</sub> parameters of the HMM. Each line is an initial probability, with the format <tt>InitialState LogProbability</tt>.

    Each <tt>InitialState</tt> is a PoS-bigram code with the form <tt>0.tag</tt>. Probabilities are given in logarithmic form to avoid underflows.

    E.g. the following line indicates the probability that the sequence starts with a determiner. <tt>0.DA -1.744857</tt>

    E.g. the following line indicates the probability that the sequence starts with an unknown tag. <tt>0.x -10.462703</tt>

*   Section `<Word>`. Contains a list of word probabilities <tt>P(w)</tt> (estimated via your preferred method). It is used, toghether with the tag probabilities above, to compute emission probabilities (_b_<sub>iw</sub> parameters of the HMM).

    Each line is a word probability <tt>P(w)</tt> with format: <tt>word LogProbability</tt>. A special line for `<UNOBSERVED_WORD>` must be included. Sample lines for this section are:

    `afortunado -13.69500` `sutil -13.57721` `<UNOBSERVED_WORD> -13.82853`

*   Section `<Smoothing>` contains three lines with the coefficients used for linear interpolation of unigram (`c1`), bigram (`c2`), and trigram (`c3`) probabilities. The section looks like:

    `<Smoothing>` `c1 0.120970620869314` `c2 0.364310868831106` `c3 0.51471851029958` `</Smoothing>`

*   Section `<Forbidden>` is the only that is not generated by the training scripts, and is supposed to be manually added (if needed). The utility is to prevent smoothing of some combinations that are known to have zero probability.

    Lines in this section are trigrams, in the same format than above: `Tag1.Tag2.Tag3`

    Trigrams listed in this section will be assigned zero probability, and no smoothing will be performed. This will cause the tagger to avoid any solution including these subsequences.

    The first tag may be a wildcard (`*`), which will match any tag, or the tag `0` which denotes sentence beginning. These two special tags can only be used in the first position of the trigram.

    In the case of an EAGLES tagset, the tags in the trigram may be either the short or the long version. The tags in the trigram (except the special tags `*` and `0`) can be restricted to a certain lemma, suffixing them with the lemma in angle brackets.

    For instance, the following rules will assign zero probability to any sequence containing the specified trigram:

    `*.PT.NC`: a noun after an interrogative pronoun. `0.DT.VMI`: a verb in indicative following a determiner just after sentence beggining. `SP.PP.NC`: a noun following a preposition and a personal pronoun.

    Similarly, the set of rules:

    `*.VAI<haber>.NC` `*.VAI<haber>.AQ` `*.VAI<haber>.VMP00SF` `*.VAI<haber>.VMP00PF` `*.VAI<haber>.VMP00PM`

    will assign zero probability to any sequence containing the verb ``haber'' tagged as an auxiliar (VAI) followed by any of the listed tags. Note that the masculine singular participle is not excluded, since it is the only allowed after an auxiliary ``haber''.

## Relaxation-Labelling Constraint Grammar File {#relaxation-labelling-constraint-grammar-file}

The syntax of the file is based on that of Constraint Grammars [KVHA95], but simplified in many aspects, and modified to include weighted constraints.

An initial file based on statistical constraints may be generated from a tagged corpus using the <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt> script provided with FreeLing. Later, hand written constraints can be added to the file to improve the tagger behaviour.

The file consists of two sections: <tt>SETS</tt> and <tt>CONSTRAINTS</tt>.

### Set definition {#set-definition}

The <tt>SETS</tt> section consists of a list of set definitions, each of the form <tt>Set-name = element1 element2 ... elementN ;</tt>

Where the <tt>Set-name</tt> is any alphanumeric string starting with a capital letter, and the elements are either forms, lemmas, plain PoS tags, or senses. Forms are enclosed in parenthesis -e.g. `(comimos)`-, lemmas in angle brackets -e.g. `<comer>`-, PoS tags are alphanumeric strings starting with a capital letter -e.g. `NCMS000`-, and senses are enclosed in square brackets -e.g. `[00794578]`. The sets must be homogeneous: That is, all the elements of a set have to be of the same kind.

Examples of set definitions:

<pre>   DetMasc = DA0MS0 DA0MP0 DD0MS0 DD0MP0 DI0MS0 DI0MP0 DP1MSP DP1MPP
             DP2MSP DP2MPP DT0MS0 DT0MP0 DE0MS0 DE0MP0 AQ0MS0 AQ0MP0;
   VerbPron = <dar_cuenta> <atrever> <arrepentir> <equivocar> <inmutar>
              <morir> <ir> <manifestar> <precipitar> <referir> <venir>;
   Animal = [00008019] [00862484] [00862617] [00862750] [00862871] [00863425]
            [00863992] [00864099] [00864394] [00865075] [00865379] [00865569]
            [00865638] [00867302] [00867448] [00867773] [00867864] [00868028]
            [00868297] [00868486] [00868585] [00868729] [00911889] [00985200]
            [00990770] [01420347] [01586897] [01661105] [01661246] [01664986] 
            [01813568] [01883430] [01947400] [07400072] [07501137];
</pre>

### Constraint definition {#constraint-definition}

The <tt>CONSTRAINTS</tt> section consists of a series of context constraits, each of the form: <tt>weight core context;</tt>

Where:

*   <tt>weight</tt> is a real value stating the compatibility (or incompatibility if negative) degree of the <tt>label</tt> with the <tt>context</tt>.
*   <tt>core</tt> indicates the analysis or analyses (form interpretation) in a word that will be affected by the constraint. It may be:
    *   Plain tag: A plain complete PoS tag, e.g. <tt>VMIP3S0</tt>
    *   Wildcarded tag: A PoS tag prefix, right-wilcarded, e.g. <tt>VMI*</tt>, <tt>VMIP*</tt>.
    *   Lemma: A lemma enclosed in angle brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `<comer>`, `VMIP3S0<comer>`, `VMI*<comer>` will match any word analysis with those tag/prefix and lemma.
    *   Form: Form enclosed in parenthesis, preceded by a PoS tag (or a wilcarded tag). e.g. <tt>VMIP3S0(comió)</tt>, <tt>VMI*(comió)</tt> will match any word analysis with those tag/prefix and form. Note that the form alone is not allowed in the rule core, since the rule woull to distinguish among different analysis of the same form.
    *   Sense: A sense code enclosed in square brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `[00862617]`, `NCMS000[00862617]`, `NC*[00862617]` will match any word analysis with those tag/prefix and sense.
*   <tt>context</tt> is a list of conditions that the context of the word must satisfy for the constraint to be applied. Each condition is enclosed in parenthesis and the list (and thus the constraint) is finished with a semicolon. Each condition has the form: <tt>(position terms)</tt> or either: <tt>(position terms barrier terms)</tt>

    Conditions may be negated using the token <tt>not</tt>, i.e. <tt>(not pos terms)</tt>

    Where:

    *   <tt>position</tt> is the relative position where the condition must be satisfied: -1 indicates the previous word and +1 the next word. A position with a star (e.g. -2*) indicates that any word is allowed to match starting from the indicated position and advancing towards the beggining/end of the sentence.
    *   <tt>terms</tt> is a list of one or more terms separated by the token <tt>or</tt>. Each term may be:
        *   Plain tag: A plain complete PoS tag, e.g. <tt>VMIP3S0</tt>
        *   Wildcarded tag: A PoS tag prefix, right-wilcarded, e.g. <tt>VMI*</tt>, <tt>VMIP*</tt>.
        *   Lemma: A lemma enclosed in angle brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `<comer>`, `VMIP3S0<comer>`, `VMI*<comer>` will match any word analysis with those tag/prefix and lemma.
        *   Form: Form enclosed in parenthesis, optionally preceded by a PoS tag (or a wilcarded tag). e.g. <tt>(comió)</tt>, <tt>VMIP3S0(comió)</tt>, <tt>VMI*(comió)</tt> will match any word analysis with those tag/prefix and form. Note that -contrarily to when defining the rule core- the form alone is allowed in the context.
        *   Sense: A sense code enclosed in square brackets, optionaly preceded by a tag or a wildcarded tag. e.g. `[00862617]`, `NCMS000[00862617]`, `NC*[00862617]` will match any word analysis with those tag/prefix and sense.
        *   Set reference: A name of a previously defined SET in curly brackets. e.g. `{DetMasc}`, `{VerbPron}` will match any word analysis with a tag, lemma or sense in the specified set.
    *   <tt>barrier</tt> states that the a match of the first term list is only acceptable if between the focus word and the matching word there is no match for the second term list.

Note that the use of sense information in the rules of the constraint grammar (either in the core or in the context) only makes sense when this information distinguishes one analysis from another. If the sense tagging has been performed with the option `DuplicateAnalysis=no`, each PoS tag will have a list with all analysis, so the sense information will not distinguish one analysis from the other (there will be only one analysis with that sense, which will have at the same time all the other senses as well). If the option `DuplicateAnalysis` was active, the sense tagger duplicates the analysis, creating a new entry for each sense. So, when a rule selects an analysis having a certain sense, it is unselecting the other copies of the same analysis with different senses.

### Examples {#examples}

Examples: The next constraint states a high incompatibility for a word being a definite determiner (<tt>DA*</tt>) if the next word is a personal form of a verb (<tt>VMI*</tt>): <tt>-8.143 DA* (1 VMI*);</tt>

The next constraint states a very high compatibility for the word mucho (much) being an indefinite determiner (<tt>DI*</tt>) -and thus not being a pronoun or an adverb, or any other analysis it may have- if the following word is a noun (<tt>NC*</tt>): <tt>60.0 DI* (mucho) (1 NC*);</tt>

The next constraint states a positive compatibility value for a word being a noun (<tt>NC*</tt>) if somewhere to its left there is a determiner or an adjective (<tt>DA* or AQ*</tt>), and between them there is not any other noun: <tt>5.0 NC* (-1* DA* or AQ* barrier NC*);</tt>

The next constraint states a positive compatibility value for a word being a masculine noun (<tt>NCM*</tt>) if the word to its left is a masculine determiner. It refers to a previously defined SET which should contain the list of all tags that are masculine determiners. This rule could be useful to correctly tag Spanish words which have two different NC analysis differing in gender: e.g. el cura (the priest) vs. la cura (the cure): <tt>5.0 NCM* (-1* DetMasc;)</tt>

The next constraint adds some positive compatibility to a 3rd person personal pronoun being of undefined gender and number (<tt>PP3CNA00</tt>) if it has the possibility of being masculine singular (<tt>PP3MSA00</tt>), the next word may have lemma estar (to be), and the second word to the right is not a gerund (<tt>VMG</tt>). This rule is intended to solve the different behaviour of the Spanish word lo (it) in sentences such as ``Â¿Cansado? Si, lo estoy.'' (Tired? Yes, I am [it]) or ``lo estoy viendo.'' (I am watching it). `0.5 PP3CNA00 (0 PP3MSA00) (1 <estar>) (not 2 VMG*);`
