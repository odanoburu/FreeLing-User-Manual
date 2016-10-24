
## Example 1: The Basics

FreeLing library provides two kind of classes: Linguistic object classes and language processing classes. The former are used to contain linguist information about the text and are classes such as `word`, `sentence`, `analysis`, `parse_tree`, etc. The later are classes that get as input some partially analyzed linguistic object (e.g. a `sentence`) and enrich it with more linguistic information (e.g. marking the right PoS tag for each `word`in it, or adding a `parse_tree` to the `sentence`). Examples of processing classes are `pos_tagger`, `dependency_parser`, or `nec` (named entity classifier).

The first program we are going to build is a chain of modules that will input text, tag each word with its right part-of-speech (that, is a PoS tagger), and make some kind of processing with the result.

The first thing our program needs to do, is including the library headers:


	#include "freeling.h"
	
Next, we need to tell freeling which UTF8 locale we will be using (`"default"` stands for `en_US.UTF8`)

	  /// set locale to an UTF8 compatible locale
	  freeling::util::init_locale(L"default");
	

Then, we can start creating modules. Most module constructors require a configuration file. We will use configuration files in default freeling language data directories (you may change `/usr/local` to whatever directory you installed FreeLing in).

Note that you can write your own configuration files and place them wherever you like.
See [user manual](https://talp-upc.gitbooks.io/freeling-user-manual/content/) for details on the format and content of configuration files for each available module.

	  /// FreeLing installation directory
	  wstring ipath = L"/usr/local";
	  /// path to data for target language
	  wstring lang = L"en";
	  wstring lpath = ipath+L"/share/freeling/"+lang+L"/";
	
	  // create analyzers
	  freeling::tokenizer tk(lpath + L"tokenizer.dat");
	  freeling::splitter sp(lpath + L"splitter.dat");
	  freeling::splitter::session_id sid = sp.open_session();

So far, we created a tokenizer and a splitter.
Next, we will create a morphological analyzer and a PoS tagger.

	  // create morphological analyzer with desired options
	  freeling::maco morfo(my_maco_options(lang,lpath)); 
	  // activate/deactivate desired morphological submodules
	  morfo.set_active_options (false,// UserMap
	                            true, // NumbersDetection,
	                            true, //  PunctuationDetection,
	                            true, //  DatesDetection,
	                            true, //  DictionarySearch,
	                            true, //  AffixAnalysis,
	                            false, //  CompoundAnalysis,
	                            true, //  RetokContractions,
	                            true, //  MultiwordsDetection,
	                            true, //  NERecognition,
	                            false, //  QuantitiesDetection,
	                            true);  //  ProbabilityAssignment
	
	  // create a hmm tagger
	  freeling::hmm_tagger tagger(lpath+L"tagger.dat", true, FORCE_TAGGER); 

  Method `maco::set_active_options` is used to activate/deactivate specific morphological analysis submodules. It can be called anytime to modify the behaviour of the analyzer in subsequent calls.

  Note the call to `my_maco_options`. This function is not a member of any freeling class, we just wrote it to make the code less messy. It creates a `maco_options` object with the configuration we want for our morphological analyzer. This is because the morphological analyzer is not a single module, but a cascade of different modules, each with its own configuration options.
  We can write `my_maco_options` as follows:

	freeling::maco_options my_maco_options(const wstring &lang, const wstring &path) {
	  // create options pack
	  freeling::maco_options opt(lang);
	  // fill it with files for morphological submodules. Only those that are going
	  // to be used need to be provided.
	  opt.UserMapFile=L"";
	  opt.LocutionsFile=path+L"locucions.dat"; opt.AffixFile=path+L"afixos.dat";
	  opt.ProbabilityFile=path+L"probabilitats.dat"; opt.DictionaryFile=path+L"dicc.src";
	  opt.NPdataFile=path+L"np.dat"; opt.PunctuationFile=path+L"../common/punct.dat";
	
	  return opt;
	}
	
Once all processing classes are created, we can start reading and processing text.

In this first example, We will assume we have a relatively short text that can be wholly loaded in memory and then processed:

	  // get all input text in a single string, keeping line breaks
	  wstring text=L"";
	  wstring line;
	  while (getline(wcin,line))
	    text = text + line + L"\n";
	
	  // tokenize input line into a list of words
	  list<freeling::word> lw = tk.tokenize(text);
	  // split list of words into sentences.
	  list<freeling::sentence> ls = sp.split(sid, lw, true);
	  // perform and output morphosyntactic analysis and disambiguation
	  morfo.analyze(ls);
	  tagger.analyze(ls);
	
	  // do whatever is needed with processed sentences
	  ProcessSentences(ls);

After the text is processed, the function `ProcessSentences` will do the required handling of the analysis produced by FreeLing modules.
In this first example we are simply going to traverse the data structure returned by the tagger and print morphological information associated to each word.

	void ProcessSentences(list<freeling::sentence> &ls) {
	   // for each sentence in list
	   for (list<freeling::sentence>::iterator is=ls.begin(); is!=ls.end(); ++is) {
	      // for each word in sentence
	      for (freeling::sentence::const_iterator w=is->begin(); w!=is->end(); ++w) {
	         // print word form, with PoS and lemma chosen by the tagger
	         wcout << w->get_form() << L" ";
	         wcout << w->get_lemma() << L" ";
	         wcout << w->get_tag();
	         wcout << endl;
	
	         // print possible analysis in word, output lemma, tag
	         for (freeling::word::const_iterator a=w->analysis_begin(); a!=w->analysis_end(); ++a) 
	            wcout<<L"    " << a->get_lemma() << L" " << a->get_tag() << endl;
	      }
	
	      // sentence separator, blank line
	      wcout << endl;
	   }
	}

Thus, the whole code looks like this:

	#include <iostream>
	#include "freeling.h"
	using namespace std;
	
	//---------------------------------------------
	// Do whatever is needed with analyzed sentences
	//---------------------------------------------
	
	void ProcessSentences(list<freeling::sentence> &ls) {
	
	  // for each sentence in list
	  for (list<freeling::sentence>::iterator is=ls.begin(); is!=ls.end(); is++) {
	
	    // for each word in sentence
	    for (freeling::sentence::const_iterator w=is->begin(); w!=is->end(); w++) {
	      
	      // print word form, with PoS and lemma chosen by the tagger
	      wcout << L"word '" << w->get_form() << L"'" << endl;
	      // print possible analysis in word, output lemma, tag and probability
	      wcout << L"  Possible analysis: {";
	      for (freeling::word::const_iterator a=w->analysis_begin(); a!=w->analysis_end(); ++a) 	
	        wcout << L" (" << a->get_lemma() << L"," << a->get_tag() << L")";
		  wcout << L" }" << endl;
	      wcout << L"  Selected analysis: ("<< w->get_lemma() << L", " << w->get_tag() << L")" << endl;
	
	    }
	
	    // sentence separator
	    wcout << endl;
	  }
	}
	
	//---------------------------------------------
	// Set desired options for morphological analyzer
	//---------------------------------------------
	
	freeling::maco_options my_maco_options (const wstring &lang, const wstring &lpath) {
	  // create options holder 
	  freeling::maco_options opt(lang);
	  // Provide files for morphological submodules. Note that it is not necessary
	  // to set files for modules that will not be used
	  opt.UserMapFile=L"";
	  opt.LocutionsFile=lpath+L"locucions.dat"; opt.AffixFile=lpath+L"afixos.dat";
	  opt.ProbabilityFile=lpath+L"probabilitats.dat"; opt.DictionaryFile=lpath+L"dicc.src";
	  opt.NPdataFile=lpath+L"np.dat"; opt.PunctuationFile=lpath+L"../common/punct.dat"; 
	  return opt;
	}
	
	
	/////////   MAIN SAMPLE PROGRAM  -- begin
	
	int main (int argc, char **argv) {
	
	  /// set locale to an UTF8 compatible locale
	  freeling::util::init_locale(L"default");
	
	  wstring ipath = L"/home/padro/Software/install/FL-4.0";
	  wstring lang = L"en";
	  wstring lpath = ipath+L"/share/freeling/"+lang+L"/";
	  
	  // create analyzers
	  freeling::tokenizer tk(lpath+L"tokenizer.dat"); 
	  freeling::splitter sp(lpath+L"splitter.dat");
	  freeling::splitter::session_id sid=sp.open_session();
	
	  // create the analyzer with the required set of maco_options
	  freeling::maco morfo(my_maco_options(lang,lpath)); 
	  // then, (de)activate required modules
	  morfo.set_active_options (false,  // UserMap
	                            true,  // NumbersDetection,
	                            true,  // PunctuationDetection,
	                            true,  // DatesDetection,
	                            true,  // DictionarySearch,
	                            true,  // AffixAnalysis,
	                            false, // CompoundAnalysis,
	                            true,  // RetokContractions,
	                            true,  // MultiwordsDetection,
	                            true,  // NERecognition,
	                            false, // QuantitiesDetection,
	                            true); // ProbabilityAssignment
	
	  // create a hmm tagger for spanish (with retokenization ability, and forced 
	  // to choose only one tag per word)
	  freeling::hmm_tagger tagger(lpath+L"tagger.dat", true, FORCE_TAGGER);
	
	  // get all input text in a single string 
	  wstring text=L"";
	  wstring line;
	  while (getline(wcin,line))
	    text = text + line + L"\n";
	
	
	  // tokenize input line into a list of words
	  list<freeling::word> lw = tk.tokenize(text);
	  // accumulate list of words in splitter buffer, returning a list of sentences.
	  list<freeling::sentence> ls = sp.split(sid, lw, false);
	  // perform and output morphosyntactic analysis and disambiguation
	  morfo.analyze(ls);
	  tagger.analyze(ls);
	
	  // do whatever is needed with processed sentences
	  ProcessSentences(ls);
	}

We can compile the program with

	g++ example1.cc -o example1 -lfreeling -std=c++0x

(If you installed FreeLing somewhere different than `/usr` or `/usr/local` you may need to add appropriate `-I` and `-L` flags to tell the compiler where to locate the library).

And run it with

	./example1 < mytext.txt


