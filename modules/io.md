
# Input/Output handling modules {#input-output-handling-modules}

FreeLing package includes a few classes that can convert between FreeLing analyzed documents and an output representantion. New classes can be created by the user to meet specific needs.

The I/O handlers are derived from two top abstract classes: <tt>input_handler</tt> and <tt>output_handler</tt>.

Derived classes handle a particular I/O format, and must implement the appropriate methods.

```C++
class input_handler {

 public:   
   /// constructor. 
   input_handler ();
   /// destructor
   ~input_handler();

   /// load partially analyzed sentences from 'lines' into a list of sentences
   virtual void input_sentences(const std::wstring &lines, 
                                std::list<freeling::sentence> &ls) const = 0;
   /// load partially analyzed sentences from 'lines' into a document
   virtual void input_document(const std::wstring &lines, 
                               freeling::document &doc) const;
};
```

```C++
class output_handler {

 public:   
   /// empty constructor
   output_handler();
   /// destructor
   ~output_handler();

   /// load tagset rules for PoS shortening and MSD descriptions
   void load_tagset(const std::wstring &ftag);
   /// set language 
   void set_language(const std::wstring &lg);

   /// Print appropriate header for the output 
   /// format (e.g. XML header or tag opening)
   virtual void PrintHeader(std::wostream &sout) const;
   /// print appropriate footer (e.g. close XML tags)
   virtual void PrintFooter(std::wostream &sout) const; 
   /// print given sentences to sout in appropriate format (no headers)
   virtual void PrintResults(std::wostream &sout,
                             const std::list<freeling::sentence> &ls) const=0;
   virtual std::wstring PrintResults(const std::list<freeling::sentence> &ls) const;

   /// print given document to sout in appropriate format, including headers.
   virtual void PrintResults(std::wostream &sout, 
                             const freeling::document &doc) const = 0;
   virtual std::wstring PrintResults (const freeling::document &doc) const;
};
```

## Output handlers {#output-handlers}

Currently, the following output handlers are implemented. All of them are derived from <tt>output_handler</tt>.

The module <tt>output_freeling</tt> produces the classical FreeLing output (column-like for lower analysis levels, and parenthesized trees for higher levels). The desired output can be configured by the calling application activating or deactivating print levels.

```C++
class output_freeling : public output_handler {
 public:   
   // constructor. 
   output_freeling ();
   output_freeling(const std::wstring &cfgFile);
   ~output_freeling ();

   /// output a parse tree
   void PrintTree (std::wostream &sout, 
                   freeling::parse_tree::const_iterator n, 
                   int depth) const;
   /// output a dependency tree
   void PrintDepTree (std::wostream &sout, 
                      freeling::dep_tree::const_iterator n, 
                      int depth) const;
   /// output a predicate structure 
   void PrintPredArgs (std::wostream &sout, 
                       const freeling::sentence &s) const;
   /// output a word and its morphological information
   void PrintWord (std::wostream &sout, 
                   const freeling::word &w, 
                   bool only_sel=true, 
                   bool probs=true) const;
   /// Output coreference groups
   void PrintCorefs(std::wostream &sout, 
                    const freeling::document &doc) const;
   /// Output semantic Graph
   void PrintSemgraph(std::wostream &sout, 
                      const freeling::document &doc) const;

   /// print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   /// print given document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;

   /// inherit other methods from abstract class
   using output_handler::PrintResults;

   // activate/deactivate printing levels
   void output_senses(bool);
   void output_all_senses(bool);
   void output_phonetics(bool);
   void output_dep_tree(bool);
   void output_corefs(bool);  
   void output_semgraph(bool);
};
```

The module <tt>output_conll</tt> produces a CoNLL-like column format. The default format is not exactly any of the CoNLL competitions, but an adapted version.

The module will always print all information avaliable in the document (i.e. if the document is parsed, a column for the parse tree will be generated).

The constructor may be called with a configuration file stating which columns should be printed and in which order.

```C++
class output_conll : public output_handler {

 public:   
   /// empty constructor. 
   output_conll ();
   /// constructor from cfg file
   output_conll (const std::wstring &cfgFile);
   /// destructor. 
   ~output_conll ();

   /// Fill conll_sentence from freeling::sentence
   void freeling2conll(const freeling::sentence &s, 
                       conll_sentence &cs) const;

   /// print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   /// print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```

The module <tt>output_xml</tt> produces an XML representation of the analyzed document.

The module will always print all information avaliable in the document (i.e. if the document is parsed, an XML tag for the parse tree will be generated).

```C++
class output_xml : public output_handler {

 public:   
   /// constructor. 
   output_xml ();
   output_xml (const std::wstring &cfgFile);
   /// destructor. 
   ~output_xml ();

   /// print XML file header
   void PrintHeader(std::wostream &sout) const; 
   /// print XML file footer
   void PrintFooter(std::wostream &sout) const; 

   /// print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   /// print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```

The module <tt>output_json</tt> produces a JSON object for the analyzed document.

The module will always print all information avaliable in the document (i.e. if the document is parsed, an JSON object for the parse tree will be included in the document object).

```C++
class output_json : public output_handler {

 public:   
   // constructor. 
   output_json ();
   output_json (const std::wstring &cfgFile);
   // destructor. 
   ~output_json ();

   // print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   // print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```

The module <tt>output_naf</tt> produces a NAF [FSB<sup>+</sup>14] representation for the analyzed document.

The desired output can be configured by the calling application activating or deactivating annotation layers.

```C++
class output_naf : public output_handler {
 public:   
   // constructor. 
   output_naf ();
   output_naf (const std::wstring &cfgFile);
   // destructor. 
   ~output_naf ();

   // print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   // print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;

   // print NAF header
   void PrintHeader(std::wostream &sout) const;
   // print NAF footer
   void PrintFooter(std::wostream &sout) const; 

   // activate/deactivate layer for next printings
   void ActivateLayer(const std::wstring &ly, bool b);
};
```

The module <tt>output_train</tt> produces a FreeLing specific format suitable to be used to retrain the PoS tagger (tipically after hand correction of the tagger errors).

```C++
class output_train : public output_handler {

 public:   
   // constructor. 
   output_train ();
   ~output_train ();

   void PrintWord (std::wostream &sout, 
                   const freeling::word &w, 
                   bool only_sel=true, 
                   bool probs=true) const;
   // print given sentences to sout in appropriate format
   void PrintResults (std::wostream &sout, 
                      const std::list<freeling::sentence> &ls) const;
   // print given a document to sout in appropriate format
   void PrintResults(std::wostream &sout, 
                     const freeling::document &doc) const;
   /// inherit other methods
   using output_handler::PrintResults;
};
```
