# Named Entity Recognition Module {#named-entity-recognition-module}

There are two different modules able to perform NE recognition. They can be instantiated directly, or via a wrapper that will create the right module depending on the configuration file.

The API for the wrapper is the following:

```C++
class ner {
  public:
    /// Constructor
    ner(const std::wstring &cfgfile);
    /// Destructor
    ~ner();

    /// analyze given sentence
    void analyze(sentence &s) const;

    /// analyze given sentences
    void analyze(std::list<sentence> &ls) const;

    /// analyze sentence, return analyzed copy
    sentence analyze(const sentence &s) const;

    /// analyze sentences, return analyzed copy
    std::list<sentence> analyze(const std::list<sentence> &ls) const;
};
```

The parameter to the constructor is the absolute name of a configuration file, which must contain the desired module type (`basic` or `bio`) in a line enclosed by the tags `<Type>` and `</Type>`.

The rest of the file must contain the configuration options specific for the selected NER type, described below.

The <tt>basic</tt> module is simple and fast, and easy to adapt for use in new languages, provided capitalization is the basic clue for NE detection in the target language. The estimated performance of this module is about 85% correctly recognized named entities.

The <tt>bio</tt> module, is based on machine learning algorithms. It has a higher precision (over 90%), but it is remarkably slower than <tt>basic</tt>, and adaptation to new languages requires a training corpus plus some feature engineering.

## Basic NER module (<tt>np</tt>) {#basic-ner-module-np}

The first NER module is the <tt>np</tt> class, which is a just an ATN that basically detects sequences of capitalized words, taking into account some functional words (e.g. Bank of England) and capitalization at sentence begginings.

It can be instantiated via the <tt>ner</tt> wrapper described above, or directly via its own API:

```C++
class np: public ner_module, public automat {
  public:
    /// Constructor, receives a configuration file.
    np(const std::string &cfgfile); 

    /// Detect multiwords starting at given sentence position
    bool matching(sentence &s, sentence::iterator &p) const;

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

The file that controls the behaviour of the simple NE recognizer consists of the following sections:

*   Section `<FunctionWords>` lists the function words that can be embeeded inside a proper noun (e.g. preposisions and articles such as those in ``Banco de EspaÃ±a'' or ``Foundation for the Eradication of Poverty''). For instance:

    <pre><FunctionWords>
    el
    la
    los
    las
    de
    del
    para
    </FunctionWords>
    </pre>

*   Section `<SpecialPunct>` lists the PoS tags (according to punctuation tags definition file, section

    4.6

    ) after which a capitalized word may be indicating just a sentence or clause beggining and not necessarily a named entity. Typical cases are colon, open parenthesis, dot, hyphen..

    <pre><SpecialPunct>
    Fpa
    Fp
    Fd
    Fg
    </SpecialPunct>
    </pre>

*   Section `<NE_Tag>` contains only one line with the PoS tag that will be assigned to the recognized entities. If the NE classifier is going to be used later, it will have to be informed of this tag at creation time.

    <pre><NE_Tag>
    NP00000
    </NE_Tag>
    </pre>

*   Section `<Ignore>` contains a list of forms (lowercased) or PoS tags (uppercased) that are not to be considered a named entity even when they appear capitalized in the middle of a sentence. For instance, the word Spanish in the sentence He started studying Spanish two years ago is not a named entity. If the words in the list appear with other capitalized words, they are considered to form a named entity (e.g. An announcement of the Spanish Bank of Commerce was issued yesterday). The same distinction applies to the word I in the sentences whatever you say, I don't believe, and _That was the death of Henry I_.

    Each word or tag is followed by a 0 or 1 indicating whether the ignore condition is strict (0: non-strict, 1: strict). The entries marked as non-strict will have the behaviour described above. The entries marked as strict will never be considered named entities or NE parts.

    For instance, the following `<Ignore>` section states that the word ``I'' is not to be a proper noun (whatever you say, I don't believe) unless some of its neighbour words are ( _That was the death of Henry I_). It also states that any word with the <tt>RB</tt> tag, and any of the listed language names must never be considered as possible NEs.

    <pre><Ignore>
    i  0
    RB 1
    english 1
    dutch 1
    spanish 1
    </Ignore>
    </pre>

*   Section `<Names>` contains a list of lemmas that may be names, even if they conflict with some of the heuristic criteria used by the NE recognizer. This is useful when they appear capitalized at sentence beggining. For instance, the basque name Miren (Mary) or the nickname Pelé may appear at the beggining of a Spanish sentence. Since both of them are verbal forms in Spanish, they would not be considered candidates to form named entities.

    Including the form in the `<Names>` section, causes the NE choice to be added to the possible tags of the form, giving the tagger the chance to decide whether it is actually a verb or a proper noun.

    <pre><Names>
    miren
    pelé
    zapatero
    china
    </Names>
    </pre>

*   Section `<Affixes>` contains a list of words that may be part of a NE -either prefixing or suffixing it- even if they are lowercased. For instance, this is the case of the word don in Spanish (e.g. don_Juan should be a NE, even if don is lowercased), or the word junior or jr. in English (e.g. Peter_Grasswick_jr. should be a NE, even if _jr._ is lowercased).

    The section should containt a word per line, followed by the keyword <tt>PRE</tt> or <tt>SUF</tt> stating whether the word may be attached before or after an NE. It a word should be either a prefix or a suffix, it must be declared in two different lines, one with each keyword.

    <pre><Affixes>
    don  PRE
    doña PRE
    jr.  SUF
    <Affixes>
    </pre>

*   Sections `<RE_NounAdj>` `<RE_Closed>` and `<RE_DateNumPunct>` allow to modify the default regular expressions for Part-of-Speech tags. This regular expressions are used by the NER to determine whether a sentence-beginning word has some tag that is Noun or Adj, or any tag that is a closed category, or one of date/punctuation/number. The default is to check against Eagles tags, thus, the recognizer will fail to identifiy these categories if your dictionary uses another tagset, unless you specify the right patterns to look for.

    For instance, if our dictionary uses Penn-Treebank-like tags, we should define:

    <pre><RE_NounAdj>
    ^(NN$|NNS|JJ)
    </RE_NounAdj>
    <RE_Closed>
    ^(D|IN|C)
    </RE_Closed>
    </pre>

*   Section `<TitleLimit>` contains only one line with an integer value stating the length beyond which a sentence written _entirely_ in uppercase will be considered a title and not a proper noun. Example:

    <pre><TitleLimit>
    3
    </TitleLimit>
    </pre>

    If `TitleLimit=0` (the default) title detection is deactivated (i.e, all-uppercase sentences are always marked as named entities).

    The idea of this heuristic is that newspaper titles are usually written in uppercase, and tend to have at least two or three words, while named entities written in this way tend to be acronyms (e.g. IBM, DARPA, ...) and usually have at most one or two words.

    For instance, if `TitleLimit=3` the sentence <tt>FREELING ENTERS NASDAC UNDER CLOSE OBSERVATION OF MARKET ANALYSTS</tt> will not be recognized as a named entity, and will have its words analyzed independently. On the other hand, the sentence <tt>IBM INC.</tt>, having less than 3 words, will be considered a proper noun.

    Obviously this heuristic is not 100% accurate, but in some cases (e.g. if you are analyzing newspapers) it may be preferrable to the default behaviour (which is not 100% accurate, either).

*   Section `<SplitMultiwords>` contains only one line with either `yes` or `no`. If `SplitMultiwords` is activated Named Entities still will be recognized but they will not be treated as a unit with only one Part-of-Speech tag for the whole compound. Each word gets its own Part-of-Speech tag instead. Capitalized words get the Part-of-Speech tag as specified in `NE_Tag`, The Part-of-Speech tags of non-capitalized words inside a Named Entity (typically, prepositions and articles) will be left untouched.

    <pre><SplitMultiwords>
    no
    </SplitMultiwords>
    </pre>

## BIO NER module (<tt>bioner</tt>) {#bio-ner-module-bioner}

The machine-learning based NER module uses a classification algorithm to decide whether each word is at a NE begin (<tt>B</tt>), inside (<tt>I</tt>) or outside (<tt>O</tt>). Then, a simple viterbi algorithm is applied to guarantee sequence coherence.

It can be instantiated via the <tt>ner</tt> wrapper described above, or directly via its own API:

```C++
class bioner: public ner_module {
  public:
    /// Constructor, receives the name of the configuration file.
    bioner ( const std::string & );

    /// analyze given sentence.
    void analyze(sentence &) const;

    /// analyze given sentences.
    void analyze(std::list<sentence> &) const;

    /// return analyzed copy of given sentence
    sentence analyze(const sentence &) const;

    /// return analyzed copy of given sentences
    std::list<sentence> analyze(const std::list<sentence> &) const;
};
```

The configuration file sets the required model and lexicon files, which may be generated from a training corpus using the scripts provided with FreeLing (in folder <tt>src/utilities/nerc</tt>). Check the README and comments in the scripts to find out what to do.

The most important file in the set is the <tt>.rgf</tt> file, which contains a definition of the context features that must be extracted for each named entity. The feature rule language is described in section

5.4

.

The sections of the configuration file for bioner module are:

*   Section `<RGF>` contains one line with the path to the RGF file of the model. This file is the definition of the features that will be taken into account for NER.

    <pre><RGF>
    ner.rgf
    </RGF>
    </pre>

*   Section `<Classifier>` contains one line with the kind of classifier to use. Valid values are `AdaBoost` and `SVM`.

    <pre><Classifier>
    Adaboost
    </Classifier>
    </pre>

*   Section `<ModelFile>` contains one line with the path to the model file to be used. The model file must match the classifier type given in section `<Classifier>`.

    <pre><ModelFile>
    ner.abm
    </ModelFile>
    </pre>

    The <tt>.abm</tt> files contain AdaBoost models based on shallow Decision Trees (see [CMP03] for details). You don't need to understand this, unless you want to enter into the code of the AdaBoost classifier.

    The <tt>.svm</tt> files contain Support Vector Machine models generated by <tt>libsvm</tt> [CL11]. You don't need to understand this, unless you want to enter into the code of <tt>libsvm</tt>.

*   Section `<Lexicon>` contains one line with the path to the lexicon file of the learnt model. The lexicon is used to translate string-encoded features generated by the extractor to integer-encoded features needed by the classifier. The lexicon file is generated at training time.

    <pre><Lexicon>
    ner.lex
    </Lexicon>
    </pre>

    The <tt>.lex</tt> file is a dictionary that assigns a number to each symbolic feature used in the AdaBoost or SVM model. You don't need to understand this either unless you are a Machine Learning student or the like.
*   Section `<UseSoftMax>` contains only one line with _yes_ or no, indicating whether the classifier output must be converted to probabilities with the SoftMax function. Currently, AdaBoost models need that conversion, and SVM models do not.

    <pre><UseSoftMax>
    yes
    </UseSoftMax>
    </pre>

*   Section `<Classes>` contains only one line with the classes of the model and its translation to B, I, O tag.

    <pre><Classes>
    0 B 1 I 2 O
    </Classes>
    </pre>

*   Section `<NE_Tag>` contains only one line with the PoS tag that will be assigned to the recognized entities. If the NE classifier is going to be used later, it will have to be informed of this tag at creation time.

    <pre><NE_Tag>
    NP00000
    </NE_Tag>
    </pre>

*   Section `<InitialProb>` Contains the probabilities of seeing each class at the begining of a sentence. These probabilities are necessary for the Viterbi algorithm used to annotate NEs in a sentence.

    <pre><InitialProb>
    B 0.200072
    I 0.0
    O 0.799928
    </InitialProb>
    </pre>

*   Section `<TransitionProb>` Contains the transition probabilities for each class to each other class, used by the Viterbi algorithm.

    <pre><TransitionProb>
    B B 0.00829346
    B I 0.395481
    B O 0.596225
    I B 0.0053865
    I I 0.479818
    I O 0.514795
    O B 0.0758838
    O I 0.0
    O O 0.924116
    </TransitionProb>
    </pre>

*   Section `<TitleLimit>` contains only one line with an integer value stating the length beyond which a sentence written _entirely_ in uppercase will be considered a title and not a proper noun. Example:

    <pre><TitleLimit>
    3
    </TitleLimit>
    </pre>

    If `TitleLimit=0` (the default) title detection is deactivated (i.e, all-uppercase sentences are always marked as named entities).

    The idea of this heuristic is that newspaper titles are usually written in uppercase, and tend to have at least two or three words, while named entities written in this way tend to be acronyms (e.g. IBM, DARPA, ...) and usually have at most one or two words.

    For instance, if `TitleLimit=3` the sentence <tt>FREELING ENTERS NASDAC UNDER CLOSE OBSERVATION OF MARKET ANALYSTS</tt> will not be recognized as a named entity, and will have its words analyzed independently. On the other hand, the sentence <tt>IBM INC.</tt>, having less than 3 words, will be considered a proper noun.

    Obviously this heuristic is not 100% accurate, but in some cases (e.g. if you are analyzing newspapers) it may be preferrable to the default behaviour (which is not 100% accurate, either).

*   Section `<SplitMultiwords>` contains only one line with either `yes` or `no`. If `SplitMultiwords` is activated Named Entities still will be recognized but they will not be treated as a unit with only one Part-of-Speech tag for the whole compound. Each word gets its own Part-of-Speech tag instead. Capitalized words get the Part-of-Speech tag as specified in `NE_Tag`, The Part-of-Speech tags of non-capitalized words inside a Named Entity (typically, prepositions and articles) will be left untouched.

    <pre><SplitMultiwords>
    no
    </SplitMultiwords>
    </pre>
