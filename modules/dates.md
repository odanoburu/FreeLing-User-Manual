# Dates Detection Module {#dates-detection-module}

The dates detection module, as the number detection module, is a collection of language-specific Augmented Transition Networks, and for this reason needs no data file to be provided at instantiation time.

For languages that do not have a specific ATN, a default analyzer is used that detects simple date patterns (e.g. <tt>DD-MM-AAAA</tt>, <tt>MM/DD/AAAA</tt>, etc.)

The API of the class is:

```C++        
class dates {             
  public:   
    /// Constructor: receives the language code
    dates(const std::string &lang); 

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

The only parameter expected by the constructor is the language of the text to analyze, in order to be able to apply the appropriate specific automata, or select the default one if none is available.

