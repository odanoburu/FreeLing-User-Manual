
# Word Sense Disambiguation Module {#word-sense-disambiguation-module}

This module performs word-sense-disambiguation on content words in given sentences. This module is to be used if word sense disambiguation (WSD) is desired. If no disambiguation (or basic most-frequent-sense disambiguation) is needed, the senses module described in section

4.15

is a lighter and faster option.

The module is an implementation of UKB algorithm [AS09]. UKB relies on a semantic relation network (in this case, WN and XWN) to disambiguate the most likely senses for words in a text using PageRank algorithm. See [AS09] for details on the algorithm.

The module expects the input words to have been annotated with a list of candidate senses by the senses module (section

4.15

) It ranks the candidate senses and sorts the list, according to the PageRank for each sense. The rank value is also provided in the result.

The API of the class is the following:

```C++
class ukb {
  public:
    /// Constructor. Receives a configuration file for UKB
    ukb(const std::string &cfgfile);

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

The constructor receives a file name where module configuration options are found. The contents of the configuration files are the following:

*   A section `<PageRankParameters>` specifying values for UKB stopping criteria. E.g.:

    <pre>    <PageRankParameters>
        Epsilon 0.03
        MaxIterations 10 
        Damping 0.85
        </PageRankParameters>
    </pre>

    These parameters are UKB parameters: The an _epsilon_ float value that controls the precision with with the end of PageRank iterations is decided, and a MaxIterations integer, that controls the maximum number of PageRank iterations, even is no convergence is reached. The Damping parameter is the standard parameter in PageRank algorithm.
*   A section `<RelationFile>` specifying the knowledge base required by the algorithm. This section must one lines, with the path to a file containing a list of relations between senses.

    <pre>    <RelationFile>
        ../common/xwn.dat
        </RelationFile>
    </pre>

    The path may be absolute, or relative to the position of the ukb module configuration file.

    The RelationFile contains the semantic relationship graph to load. It is a text filecontaining pairs of related senses (WN synsets in this case). Relations are not labelled nor directed.

    An example of the content of this file is:

    <pre>   00003431-v 14877585-n
       00003483-r 00104099-r
       00003483-r 00890351-a
    </pre>
