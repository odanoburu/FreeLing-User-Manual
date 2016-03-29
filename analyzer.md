
# Using <tt>analyzer</tt> Program to Process Corpora {#using-analyzer-program-to-process-corpora}

The simplest way to use the FreeLing libraries is via the provided `analyzer` main program, which allows the user to process an input text to obtain several linguistic processings.

Since it is impossible to write a program that fits everyone's needs, `analyzer` offers you almost all functionalities included in FreeLing, but if you want it to output more information, or do so in a specific format, or combine the modules in a different way, the right path to follow is building your own main program or adapting one of the existing, as described in section [Using the library from your own application](user-application.md).

The `analyzer` program is usually called with an option `-f config-file` (if ommitted, it will search for a file named `analyzer.cfg` in the current directory). The given `config-file` must be an absolute file name, or a relative path to the current directory.

You can use the default configuration files (located at `/usr/local/share/freeling/config` if you installed from tarball, or at `/usr/share/freeling/config` if you used a `.deb` package), or either a config file that suits your needs. Note that the default configuration files require the environment variable `FREELINGSHARE` to be defined and to point to a directory with valid FreeLing data files (e.g. `/usr/local/share/freeling`).

Environment variables are used for flexibility (e.g. avoid having to modify configuration files if you relocate your data files), but if you don't need them, you can replace all occurrences of `FREELINGSHARE` in your configuration files with a static path.

The `analyzer` program provides also a server mode (use option `-server`) which expects the input from a socket. The program `analyzer_client` can be used to read input files and send requests to the server. The advantatge is that the server remains loaded after analyzing each client's request, thus reducing the start-up overhead if many small files have to be processed. Client and server communicate via sockets. The client-server approach is also a good strategy to call FreeLing from a language or platform for which no API is provided: Just launch a server and use you preferred language to program a client that behaves like `analyzer_client`.

The `analyze` (no final "<tt>r</tt>") script described below handles all these default paths and variables and makes everything easier if you want to use the defaults.

## The easy way: Using the <tt>analyze</tt> script {#the-easy-way-using-the-analyze-script}

To ease the invocation of the program, a script named <tt>analyze</tt> (no final <tt>r</tt>) is provided. This is script is able to locate default configuration files, define library search paths, and handle whether you want the client-server or the straight version.

The sample main program is called with the command:

`analyze [-f config-file] [options]` 

If `-f config-file` is not specified, a file named `analyzer.cfg` is searched in the current working directory.

If `-f config-file` is specified but not found in the current directory, it will be searched in FreeLing installation directory, which is one of:

*   `/usr/local/share/freeling/config` if you installed from source
*   `/usr/share/freeling/config` if you used a binary `.deb` package).
*   `myfreeling/share/freeling/config` if you used `--prefix=myfreeling` option with `./configure`.

Extra options may be specified in the command line to override any settings in `config-file`. See section [Valid Options](#valid-options).


### Stand-alone mode {#stand-alone-mode}

The default mode will launch a stand-alone analyzer, which will load the configuration, read input from stdin, write results to stdout, and exit. E.g.:

`analyze -f en.cfg  <myinput  >myoutput` 

When the input file ends, the analyzer will stop and it will have to be reloaded again to process a new file.


### Client/server mode {#client-server-mode}

If `--server` and `--port` options are specified, a server will be launched which starts listening for incoming requests. E.g.:

`analyze -f en.cfg  --server --port 50005 &`

Once the server is launched, clients can request analysis to the server, with:

`analyzer_client 50005  <myinput  >myoutput `  
`analyzer_client localhost:50005  <myinput  >myoutput`

or, from a remote machine:

`analyzer_client my.server.com:50005  <myinput  >myoutput`  
`analyzer_client 192.168.10.11:50005  <myinput  >myoutput`

The server will fork a new process to attend each new client, so you can have many clients being served at the same time.

You can control the maximum amount of clients being attended simutaneously (in order to prevent a flood in your server) with the option `--workers`. You can control the size of the queue of pending clients with option `--queue`. Clients trying to connect when the queue is full will receive a connection error. See section [Valid Options](#valid-options) for details on these options.


## Using a threaded analyzer {#using-a-threaded-analyzer}

If `libboost_thread` is installed, the installation process will build the program `threaded_analyzer`. 
This program behaves like `analyzer`, and has almost the same options.

The program `threaded_analyzer` launches each processor in a separate thread, so while one sentece is being parsed, the next is being tagged, and the following one is running through the morphological analyzer. In this way, the multi-core capabilities of the host are better exploited and the analyzer runs faster.

Although it is intended mainly as an example for developers wanting to build their own threaded applications, this program can also be used to analyze texts, in the same way than `analyzer`.

Nevertheless, notice that this example program does not include modules that are not token- or sentence-oriented, namely, language identification and coreference resolution.


# Usage example {#usage-example}

Assuming we have the following input file `mytext.txt`:

    El gato come pescado. Pero a Don Jaime no le gustan los gatos.

we could issue the command:

`analyze -f myconfig.cfg <mytext.txt >mytext.mrf` 

Assuming that `myconfig.cfg` is the file presented in section [Sample Configuration File](#sample-configuration-file), the produced output would correspond to a `morfo` output level (i.e. morphological analysis but no PoS tagging). The expected results are:

```
 El el DA0MS0 1 
 gato gato NCMS000 1 
 come comer VMIP3S0 0.75 comer VMM02S0 0.25 
 pescado pescado NCMS000 0.833333 pescar VMP00SM 0.166667 
 . . Fp 1 

 Pero pero CC 0.99878 pero NCMS000 0.00121951 Pero NP00000 0.00121951 
 a a NCFS000 0.0054008 a SPS00 0.994599 
 Don_Jaime Don_Jaime NP00000 1 
 no no NCMS000 0.00231911 no RN 0.997681 
 le él PP3CSD00 1 
 gustan gustar VMIP3P0 1 
 los el DA0MP0 0.975719 lo NCMP000 0.00019425 él PP3MPA00 0.024087 
 gatos gato NCMP000 1 
 . . Fp 1
```

If we also wanted PoS tagging, we could have issued the command:

`analyze -f myconfig.cfg --outlv tagged <mytext.txt >mytext.tag`

to obtain the tagged output:

```
 El el DA0MS0
 gato gato NCMS000
 come comer VMIP3S0
 pescado pescado NCMS000
 . . Fp

 Pero pero CC
 a a SPS00
 Don_Jaime Don_Jaime NP00000
 no no RN
 le él PP3CSD00
 gustan gustar VMIP3P0
 los el DA0MP0
 gatos gato NCMP000
 . . Fp
```

We can also ask for the senses of the tagged words:

`analyze -f myconfig.cfg --outlv tagged --sense all  <mytext.txt >mytext.sen`

obtaining the output:

```
El el DA0MS0
 gato gato NCMS000 01630731:07221232:01631653
 come comer VMIP3S0 00794578:00793267
 pescado pescado NCMS000 05810856:02006311
 . . Fp

 Pero pero CC
 a a SPS00
 Don_Jaime Don_Jaime NP00000
 no no RN
 le él PP3CSD00
 gustan gustar VMIP3P0 01244897:01213391:01241953
 los el DA0MP0
 gatos gato NCMP000 01630731:07221232:01631653
 . . Fp
```

Alternatively, if we don't want to repeat the first steps that we had already performed, we could use the output of the morphological analyzer as input to the tagger:

`analyze -f myconfig.cfg --inplv morfo --outlv tagged <mytext.mrf >mytext.tag`

See options `InputLevel`, `OutputLevel`, `InputFormat`, and `OutputFormat` in section [Valid options](#valid-options) for details on which are valid input and output levels and formats.


## Configuration File and Command Line Options {#configuration-file-and-command-line-options}

Almost all options may be specified either in the configuration file or in the command line, having the later precedence over the former.

Valid options are presented in section [Valid options](#valid-options), both in their command-line and configuration file notations. Configuration files follow the usual linux standards. A sample file may be seen in section [Sample Configuration File](#sample-configuration-file).

FreeLing package includes default configuration files. They can be found at the directory `share/FreeLing/config` under the FreeLing installation directory (`/usr/local` if you installed from source, and `/usr/share/FreeLing` if you used a binary `.deb` package). The `analyze` script will try to locate the configuration file in that directory if it is not found in the current working directory.


### Valid options {#valid-options}

This section presents the options that can be given to the <tt>analyzer</tt> program (and thus, also to the <tt>analyzer_server</tt> program and to the <tt>analyze</tt> script). All options can be written in the configuration file as well as in the command line. The later has always precedence over the former.

| Command line                | Configuration file |
| --------------------------- | ------------------ |
| `-h`, `--help`, `--help-cf` | <tt>N/A</tt>       |


*   Help

| Command line                | Configuration file |
| --------------------------- | ------------------ |
| `-h`, `--help`, `--help-cf` | <tt>N/A</tt>       |

    Prints to stdout a help screen with valid options and exits.

    `--help` provides information about command line options.

    `--help-cf` provides information about configuration file options.

*   Version number

    | Command line | Configuration file |
    | --- | --- |
    | `-v`, `--version` | <tt>N/A</tt> |

    Prints the version number of currently installed FreeLing library.

*   Configuration file

    | Command line | Configuration file |
    | --- | --- |
    | `-f &lt;filename&gt;` | <tt>N/A</tt> |

    Specify configuration file to use (default: analyzer.cfg).

*   Server mode

    | Command line | Configuration file |
    | --- | --- |
    | `--server` | `ServerMode=(yes|y|on|no|n|off)` |

    Activate server mode. Requires that option `--port` is also provided.

    Default value is `off`.

*   Server Port Number

    | Command line | Configuration file |
    | --- | --- |
    | `-p &lt;int&gt;`, `--port &lt;int&gt;` | `ServerPort=&lt;int&gt;` |

    Specify port where server will be listening for requests. This option must be specified if server mode is active, and it is ignored if server mode is off.

*   Maximum Number of Server Workers

    | Command line | Configuration file |
    | --- | --- |
    | `-w &lt;int&gt;`, `--workers &lt;int&gt;` | `ServerMaxWorkers=&lt;int&gt;` |

    Specify maximum number of active workers that the server will launch. Each worker attends a client, so this is the maximum number of clients that are simultaneously attended. This option is ignored if server mode is off.

    Default vaule is 5\. Note that a high number of simultaneous workers will result in forking that many processes, which may overload the CPU and memory of your machine resulting in a system collapse.

    When the maximum number of workers is reached, new incoming requests are queued until a worker finishes.

*   Maximum Size of Server Queue

    | Command line | Configuration file |
    | --- | --- |
    | `-q &lt;int&gt;`, `--queue &lt;int&gt;` | `ServerQueueSize=&lt;int&gt;` |

    Specify maximum number of pending clients that the server socket can hold. This option is ignored if server mode is off.

    Pending clients are requests waiting for a worker to be available. They are queued in the operating system socket queue.

    Default value is 32\. Note that the operating system has an internal limit for the socket queue size (e.g. modern linux kernels set it to 128). If the given value is higher than the operating system limit, it will be ignored.

    When the pending queue is full, new incoming requests get a connection error.

*   Trace Level

    | Command line | Configuration file |
    | --- | --- |
    | `-l &lt;int&gt;`, `--tlevel &lt;int&gt;` | `TraceLevel=&lt;int&gt;` |

    Set the trace level (0 = no trace, higher values = more trace), for debugging purposes.

    This will work only if the library was compiled with tracing information, using <tt>./configure -enable-traces</tt>. Note that the code with tracing information is slower than the code compiled without it, even when traces are not active.

*   Trace Module

    | Command line | Configuration file |
    | --- | --- |
    | `-m &lt;mask&gt;`, `--tmod &lt;mask&gt;` | `TraceModule=&lt;mask&gt;` |

    Specify modules to trace. Each module is identified with an hexadecimal flag. All flags may be OR-ed to specificy the set of modules to be traced.

    Valid masks are defined in file `src/include/freeling/morfo/traces.h`, and are the following:

    | Module | Mask |
    | --- | --- |
    | Splitter | 0x00000001 |
    | Tokenizer | 0x00000002 |
    | Morphological analyzer | 0x00000004 |
    | Options management | 0x00000008 |
    | Number detection | 0x00000010 |
    | Date identification | 0x00000020 |
    | Punctuation detection | 0x00000040 |
    | Dictionary search | 0x00000080 |
    | Affixation rules | 0x00000100 |
    | Multiword detection | 0x00000200 |
    | Named entity detection | 0x00000400 |
    | Probability assignment | 0x00000800 |
    | Quantities detection | 0x00001000 |
    | Named entity classification | 0x00002000 |
    | Automata (abstract) | 0x00004000 |
    | Sense annotation | 0x00010000 |
    | Chart parser | 0x00020000 |
    | Parser grammar | 0x00040000 |
    | Dependency parser | 0x00080000 |
    | Correference resolution | 0x00100000 |
    | Utilities | 0x00200000 |
    | Word sense disambiguation | 0x00400000 |
    | Ortographic correction | 0x00800000 |
    | Database storage | 0x01000000 |
    | Feature extraction | 0x02000000 |
    | Language identifier | 0x04000000 |
    | Omlet | 0x08000000 |
    | Phonetics | 0x10000000 |

*   Language of input text

    | Command line | Configuration file |
    | --- | --- |
    | `--lang &lt;language&gt;` | `Lang=&lt;language&gt;` |

    Code for language of input text. Though it is not required, the convention is to use two-letter ISO codes (as: Asturian, es: Spanish, ca: Catalan, en: English, cy: Welsh, it: Italian, gl: Galician, pt: Portuguese, ru: Russian, old-es: old Spanish).

    Other languages may be added to the library. See chapter 

    8

    for details.

*   Locale

    | Command line | Configuration file |
    | --- | --- |
    | `--locale &lt;locale&gt;` | `Locale=&lt;locale&gt;` |

    Locale to be used to interpret both input text and data files. Usually, the value will match the locale of the `Lang` option (e.g. `es_ES.utf8` for spanish, `ca_ES.utf8` for Catalan, etc.). The values `default` (stands for `en_US.utf8`) and `system` (stands for currently active system locale) may also be used.

    *   Splitter Buffer Flushing

    | Command line | Configuration file |
    | --- | --- |
    | `--flush`, `--noflush` | `AlwaysFlush=(yes|y|on|no|n|off)` |

    When this option is inactive (most usual choice) sentence splitter buffers lines until a sentence marker is found. Then, it outputs a complete sentence.

    When this option is active, the splitter never buffers any token, and considers each newline as a sentence end, thus processing each line as an independent sentence.

    *   Input Format

    | Command line | Configuration file |
    | --- | --- |
    | `--input &lt;string&gt;` | `InputFormat=&lt;string&gt;` |

    Input format in which to expect text to analyze.

    Valid values are:

    *   <tt>text</tt>: Plain text.
    *   <tt>freeling</tt>: pseudo-column format produced by freeling with output level <tt>morfo</tt> or <tt>tagged</tt>.
    *   <tt>conll</tt>: CoNLL-like column format.

    *   Output Format

    | Command line | Configuration file |
    | --- | --- |
    | `--output &lt;string&gt;` | `OutputFormat=&lt;string&gt;` |

    Output format to produce with analysis results.

    Valid values are:

    *   <tt>freeling</tt>: Classical freeling format. It may be a pseudo-column for with output levels <tt>morfo</tt> or <tt>tagged</tt>, parenthesized trees for parsing output, or other human-readable output for coreferences or semantic graph output.
    *   <tt>conll</tt>: CoNLL-like column format.
    *   <tt>xml</tt>: FreeLing-specific XML format.
    *   <tt>json</tt>: JSON format
    *   <tt>naf</tt>: XML format following NAF conventions (see <small class="SMALL"><tt>[https://github.com/newsreader/NAF](https://github.com/newsreader/NAF)</tt></small>)
    *   <tt>train</tt>: Produce freeling pseudo-column format suitable to train PoS taggers. This option can be used to annotate a corpus, correct the output manually, and use it to retrain the taggers with the script <tt>src/utilities/train-tagger/bin/TRAIN.sh</tt> provided in FreeLing package. See <tt>src/utilities/train-tagger/README</tt> for details about how to use it.

    *   Input Level

    | Command line | Configuration file |
    | --- | --- |
    | `--inplv &lt;string&gt;` | `InputLevel=&lt;string&gt;` |

    Analysis level of input data (plain, token, splitted, morfo, tagged, shallow, dep, coref).

    *   plain: plain text.
    *   token: tokenized text (one token per line).
    *   splitted : tokenized and sentence-splitted text (one token per line, sentences separated with one blank line).
    *   morfo: tokenized, sentence-splitted, and morphologically analyzed text. One token per line, sentences separated with one blank line. Each line has the format: <tt>word (lemma tag prob)<sup>+</sup></tt>
    *   tagged: tokenized, sentence-splitted, morphologically analyzed, and PoS-tagged text. One token per line, sentences separated with one blank line. Each line has the format: <tt>word lemma tag</tt>.
    *   shallow: the previous plus constituency parsing. Only valid with <tt>InputFormat=conll</tt>.
    *   dep: the previous plus dependency parsing (may include constituents or not. May include also SRL). Only valid with <tt>InputFormat=conll</tt>.
    *   coref: the previous plus coreference. Only valid with <tt>InputFormat=conll</tt>.

    *   Output Level

    | Command line | Configuration file |
    | --- | --- |
    | `--outlv &lt;string&gt;` | `OutputLevel=&lt;string&gt;` |

    Analysis level of output data (token, splitted, morfo, tagged, shallow, dep, coref, semgraph).

    *   token: tokenized text (one token per line).
    *   splitted : tokenized and sentence-splitted text (one token per line, sentences separated with one blank line).
    *   morfo: tokenized, sentence-splitted, and morphologically analyzed text. One token per line, sentences separated with one blank line. Each line has the format: <tt>word (lemma tag prob)<sup>+</sup></tt> or (if sense tagging has been activated): <tt>word (lemma tag prob sense<sub>1</sub>:...:sense<sub>N</sub>)<sup>+</sup></tt>
    *   tagged: tokenized, sentence-splitted, morphologically analyzed, and PoS-tagged text. One token per line, sentences separated with one blank line. Each line has the format: <tt>word lemma tag prob</tt> or, if sense tagging has been activated: <tt>word lemma tag prob sense<sub>1</sub>:...:sense<sub>N</sub></tt>
    *   shallow: tokenized, sentence-splitted, morphologically analyzed, PoS-tagged, optionally sense-annotated, and shallow-parsed text, as output by the `chart_parser` module.
    *   parsed: tokenized, sentence-splitted, morphologically analyzed, PoS-tagged, optionally sense-annotated, and full-parsed text, as output by the first stage (tree completion) of the dependency parser.
    *   dep: tokenized, sentence-splitted, morphologically analyzed, PoS-tagged, optionally sense-annotated, and dependency-parsed text, as output by the second stage (transformation to dependencies and function labelling) of the dependency parser. May include also SRL.
    *   coref: the previous plus coreference.
    *   semgraph: the previous plus semantic graph. Only valid with <tt>OutputFormat=xml|json|freeling</tt>.

    *   Language Identification Configuration File

    | Command line | Configuration file |
    | --- | --- |
    | `-I &lt;filename&gt;`, `--fidn &lt;filename&gt;` | `N/A` |

    Configuration file for language identifier. See section 

    4.1

    for details.

    *   Tokenizer File

    | Command line | Configuration file |
    | --- | --- |
    | `--abrev &lt;filename&gt;` | `TokenizerFile=&lt;filename&gt;` |

    File of tokenization rules. See section 

    4.2

    for details.

    *   Splitter File

    | Command line | Configuration file |
    | --- | --- |
    | `--fsplit &lt;filename&gt;` | `SplitterFile=&lt;filename&gt;` |

    File of splitter options rules. See section 

    4.3

    for details.

    *   Affix Analysis

    | Command line | Configuration file |
    | --- | --- |
    | `--afx`, `--noafx` | `AffixAnalysis=(yes|y|on|no|n|off)` |

    Whether to perform affix analysis on unknown words. Affix analysis applies a set of affixation rules to the word to check whether it is a derived form of a known word.

    *   Affixation Rules File

    | Command line | Configuration file |
    | --- | --- |
    | `-S &lt;filename&gt;`, `--fafx &lt;filename&gt;` | `AffixFile=&lt;filename&gt;` |

    Affix rules file. See section

    4.9.2

    for details.

    *   User Map

    | Command line | Configuration file |
    | --- | --- |
    | `--usr`, `--nousr` | `UserMap=(yes|y|on|no|n|off)` |

    Whether to apply or not a file of customized word-tag mappings.

    *   User Map File

    | Command line | Configuration file |
    | --- | --- |
    | `-M &lt;filename&gt;`, `--fmap &lt;filename&gt;` | `UserMapFile=&lt;filename&gt;` |

    User Map file to be used. See section

    4.7

    for details.

    *   Multiword Detection

    | Command line | Configuration file |
    | --- | --- |
    | `--loc`, `--noloc` | `MultiwordsDetection=(yes|y|on|no|n|off)` |

    Whether to perform multiword detection. This option requires that a multiword file is provided.

    *   Multiword File

    | Command line | Configuration file |
    | --- | --- |
    | `-L &lt;filename&gt;`, `--floc &lt;filename&gt;` | `LocutionsFile=&lt;filename&gt;` |

    Multiword definition file. See section

    4.10

    for details.

    *   Number Detection

    | Command line | Configuration file |
    | --- | --- |
    | `--numb`, `--nonumb` | `NumbersDetection=(yes|y|on|no|n|off)` |

    Whether to perform nummerical expression detection. Deactivating this feature will affect the behaviour of date/time and ratio/currency detection modules.

    *   Decimal Point

    | Command line | Configuration file |
    | --- | --- |
    | `--dec &lt;string&gt;` | `DecimalPoint=&lt;string&gt;` |

    Specify decimal point character for the number detection module (for instance, in English is a dot, but in Spanish is a comma).

    *   Thousand Point

    | Command line | Configuration file |
    | --- | --- |
    | `--thou &lt;string&gt;` | `ThousandPoint=&lt;string&gt;` |

    Specify thousand point character for the number detection module (for instance, in English is a comma, but in Spanish is a dot).

    *   Punctuation Detection

    | Command line | Configuration file |
    | --- | --- |
    | `--punt`, `--nopunt` | `PunctuationDetection=(yes|y|on|no|n|off)` |

    Whether to assign PoS tag to punctuation signs.

    *   Punctuation Detection File

    | Command line | Configuration file |
    | --- | --- |
    | `-F &lt;filename&gt;`, `--fpunct &lt;filename&gt;` | `PunctuationFile=&lt;filename&gt;` |

    Punctuation symbols file. See section

    4.6

    for details.

    *   Date Detection

    | Command line | Configuration file |
    | --- | --- |
    | `--date`, `--nodate` | `DatesDetection=(yes|y|on|no|n|off)` |

    Whether to perform date and time expression detection.

    *   Quantities Detection

    | Command line | Configuration file |
    | --- | --- |
    | `--quant`, `--noquant` | `QuantitiesDetection=(yes|y|on|no|n|off)` |

    Whether to perform currency amounts, physical magnitudes, and ratio detection.

    *   Quantity Recognition File

    | Command line | Configuration file |
    | --- | --- |
    | `-Q &lt;filename&gt;`, `--fqty &lt;filename&gt;` | `QuantitiesFile=&lt;filename&gt;` |

    Quantitiy recognition configuration file. See section

    4.12

    for details.

    *   Dictionary Search

    | Command line | Configuration file |
    | --- | --- |
    | `--dict`, `--nodict` | `DictionarySearch=(yes|y|on|no|n|off)` |

    Whether to search word forms in dictionary. Deactivating this feature also deactivates AffixAnalysis option.

    *   Dictionary File

    | Command line | Configuration file |
    | --- | --- |
    | `-D &lt;filename&gt;`, `--fdict &lt;filename&gt;` | `DictionaryFile=&lt;filename&gt;` |

    Dictionary database. See section

    4.9

    and chapter

    8

    for details.

    *   Probability Assignment

    | Command line | Configuration file |
    | --- | --- |
    | `--prob`, `--noprob` | `ProbabilityAssignment=(yes|y|on|no|n|off)` |

    Whether to compute a lexical probability for each tag of each word. Deactivating this feature will affect the behaviour of the PoS tagger.

    *   Lexical Probabilities File

    | Command line | Configuration file |
    | --- | --- |
    | `-P &lt;filename&gt;`, `--fprob &lt;filename&gt;` | `ProbabilityFile=&lt;filename&gt;` |

    Lexical probabilities file. The probabilities in this file are used to compute the most likely tag for a word, as well to estimate the likely tags for unknown words. See section

    4.13

    for details.

    *   Unknown Words Probability Threshold.

    | Command line | Configuration file |
    | --- | --- |
    | `-e &lt;float&gt;`, `--thres &lt;float&gt;` | `ProbabilityThreshold=&lt;float&gt;` |

    Threshold that must be reached by the probability of a tag given the suffix of an unknown word in order to be included in the list of possible tags for that word. Default is zero (all tags are included in the list). A non-zero value (e.g. 0.0001, 0.001) is recommended.

    *   Named Entity Recognition

    | Command line | Configuration file |
    | --- | --- |
    | `--ner [bio|basic|none]` | `NERecognition=(bio|basic|none)` |

    Whether to perform NE recognition and which recognizer to use: ``bio'' for AdaBoost based NER, ``basic'' for a simple heuristic NE recognizer and ``none'' to perform no NE recognition . Deactivating this feature will cause the NE Classification module to have no effect.

    *   Named Entity Recognition

    | Command line | Configuration file |
    | --- | --- |
    | `--ner`, `--noner` | `NERecognition=(yes|y|on|no|n|off)` |

    Whether to perform NE recognition.

    *   Named Entity Recognizer File

    | Command line | Configuration file |
    | --- | --- |
    | `-N &lt;filename&gt;`, `--fnp &lt;filename&gt;` | `NPDataFile=&lt;filename&gt;` |

    Configuration data file for NE recognizer.

    See section

    4.11

    for details.

    *   Named Entity Classification

    | Command line | Configuration file |
    | --- | --- |
    | `--nec`, `--nonec` | `NEClassification=(yes|y|on|no|n|off)` |

    Whether to perform NE classification.

    *   Named Entity Classifier File

    | Command line | Configuration file |
    | --- | --- |
    | `--fnec &lt;filename&gt;` | `NECFile=&lt;filename&gt;` |

    Configuration file for Named Entity Classifier module

    See section

    4.19

    for details.

    *   Phonetic Encoding

    | Command line | Configuration file |
    | --- | --- |
    | `--phon`, `--nophon` | `Phonetics=(yes|y|on|no|n|off)` |

    Whether to add phonetic transcription to each word.

    *   Phonetic Encoder File

    | Command line | Configuration file |
    | --- | --- |
    | `--fphon &lt;filename&gt;` | `PhoneticsFile=&lt;filename&gt;` |

    Configuration file for phonetic encoding module

    See section

    4.18

    for details.

    *   Sense Annotation

    | Command line | Configuration file |
    | --- | --- |
    | `-s &lt;string&gt;`, `--sense &lt;string&gt;` | `SenseAnnotation=&lt;string&gt;` |

    Kind of sense annotation to perform

    *   no, none: Deactivate sense annotation.
    *   all: annotate with all possible senses in sense dictionary.
    *   mfs: annotate with most frequent sense.
    *   ukb: annotate all senses, ranked by UKB algorithm.

    Whether to perform sense anotation.

    If active, the PoS tag selected by the tagger for each word is enriched with a list of all its possible WN synsets. The sense repository used depends on the options ``Sense Annotation Configuration File'' and ``UKB Word Sense Disambiguator Configuration File'' described below.

    *   Sense Annotation Configuration File

    | Command line | Configuration file |
    | --- | --- |
    | `-W &lt;filename&gt;`, `--fsense &lt;filename&gt;` | `SenseConfigFile=&lt;filename&gt;` |

    Word sense annotator configuration file. See section

    4.15

    for details.

    *   UKB Word Sense Disambiguator Configuration File

    | Command line | Configuration file |
    | --- | --- |
    | `-U &lt;filename&gt;`, `--fukb &lt;filename&gt;` | `UKBConfigFile=&lt;filename&gt;` |

    UKB configuration file. See section

    4.16

    for details.

    *   Tagger algorithm

    | Command line | Configuration file |
    | --- | --- |
    | `-t &lt;string&gt;`, `--tag &lt;string&gt;` | `Tagger=&lt;string&gt;` |

    Algorithm to use for PoS tagging

    *   hmm: Hidden Markov Model tagger, based on [Bra00].
    *   relax: Relaxation Labelling tagger, based on [Pad98].

    *   HMM Tagger configuration File

    | Command line | Configuration file |
    | --- | --- |
    | `-H &lt;filename&gt;`, `--hmm &lt;filename&gt;` | `TaggerHMMFile=&lt;filename&gt;` |

    Parameters file for HMM tagger. See section

    4.17.1

    for details.

    *   Relaxation labelling tagger constraints file

    | Command line | Configuration file |
    | --- | --- |
    | `-R &lt;filename&gt;`, `--rlx &lt;filename&gt;` | `TaggerRelaxFile=&lt;filename&gt;` |

    File containing the constraints to apply to solve the PoS tagging. See section

    4.17.2

    for details.

    *   Relaxation labelling tagger iteration limit

    | Command line | Configuration file |
    | --- | --- |
    | `-i &lt;int&gt;`, `--iter &lt;int&gt;` | `TaggerRelaxMaxIter=&lt;int&gt;` |

    Maximum numbers of iterations to perform in case relaxation does not converge.

    *   Relaxation labelling tagger scale factor

    | Command line | Configuration file |
    | --- | --- |
    | `-r &lt;float&gt;`, `--sf &lt;float&gt;` | `TaggerRelaxScaleFactor=&lt;float&gt;` |

    Scale factor to normalize supports inside RL algorithm. It is comparable to the step lenght in a hill-climbing algorithm: The larger scale factor, the smaller step.

    *   Relaxation labelling tagger epsilon value

    | Command line | Configuration file |
    | --- | --- |
    | `--eps &lt;float&gt;` | `TaggerRelaxEpsilon=&lt;float&gt;` |

    Real value used to determine when a relaxation labelling iteration has produced no significant changes. The algorithm stops when no weight has changed above the specified epsilon.

    *   Retokenize contractions in dictionary

    | Command line | Configuration file |
    | --- | --- |
    | `--rtkcon`, `--nortkcon` | `RetokContractions=(yes|y|on|no|n|off)` |

    Specifies whether the dictionary must retokenize contractions when found, or leave the decision to the `TaggerRetokenize` option.

    Note that if this option is active, contractions will be retokenized even if the `TaggerRetokenize` option is not active. If this option is not active, contractions will be retokenized depending on the value of the `TaggerRetokenize` option.

    *   Retokenize after tagging

    | Command line | Configuration file |
    | --- | --- |
    | `--rtk`, `--nortk` | `TaggerRetokenize=(yes|y|on|no|n|off)` |

    Determine whether the tagger must perform retokenization after the appropriate analysis has been selected for each word. This is closely related to affix analysis and PoS taggers, see sections

    4.9.2

    and

    4.17

    for details.

    *   Force the selection of one unique tag

    | Command line | Configuration file |
    | --- | --- |
    | `--force &lt;string&gt;` | `TaggerForceSelect=(none,tagger,retok)` |

    Determine whether the tagger must be forced to (probably randomly) make a unique choice and when.

    *   <tt>none</tt>: Do not force the tagger, allow ambiguous output.
    *   <tt>tagger</tt>: Force the tagger to choose before retokenization (i.e. if retokenization introduces any ambiguity, it will be present in the final output).
    *   <tt>retok</tt>: Force the tagger to choose after retokenization (no remaining ambiguity)

    See

    4.17

    for more information.

    *   Chart Parser Grammar File

    | Command line | Configuration file |
    | --- | --- |
    | `-G &lt;filename&gt;`, `--grammar &lt;filename&gt;` | `GrammarFile=&lt;filename&gt;` |

    This file contains a CFG grammar for the chart parser, and some directives to control which chart edges are selected to build the final tree. See section

    4.20.1

    for details.

    *   Dependency Parser Rule File

    | Command line | Configuration file |
    | --- | --- |
    | `-T &lt;filename&gt;`, `--txala &lt;filename&gt;` | `DepTxalaFile==&lt;filename&gt;` |

    Rules to be used to perform rule-based dependency analysis. See section

    4.21.1

    for details.

    *   Statistical Dependency Parser File

    | Command line | Configuration file |
    | --- | --- |
    | `-E &lt;filename&gt;`, `--treeler &lt;filename&gt;` | `DepTreelerFile==&lt;filename&gt;` |

    Configuration file for statistical dependency parser and SRL module

    *   Dependency Parser Selection

    | Command line | Configuration file |
    | --- | --- |
    | `-d &lt;string&gt;`, `--dep &lt;string&gt;` | `DependencyParser==&lt;string&gt;` |

    Which dependency parser to use: <tt>txala</tt> (rule-based) or <tt>treeler</tt> (statistical, may have SRL also).

    *   Coreference Resolution File

    | Command line | Configuration file |
    | --- | --- |
    | `-C &lt;filename&gt;`, `--fcorf &lt;filename&gt;` | `CorefFile=&lt;filename&gt;` |

    Configuration file for coreference resolution module.

### Sample Configuration File {#sample-configuration-file}

A sample configuration file follows. You can start using freeling with the default configuration files which are installed at `/usr/local/share/freeling/config` (note than prefix `/usr/local` may differ if you specified an alternative location when installing FreeLing. If you installed from a binary `.deb` package), it will be at `/usr/share/freeling/config`.

You can use those files as a starting point to customize one configuration file to suit your needs.

Note that file paths in the sample configuration file contain `$FREELINGSHARE`, which is supposed to be an environment variable. If this variable is not defined, the analyzer will abort, complaining about not finding the files.

If you use the `analyze` script, it will define the variable for you as `/usr/local/share/Freeling` (or the right installation path), unless you define it to point somewhere else.

You can also adjust your configuration files to use normal paths for the files (either relative or absolute) instead of using variables.

```
##
#### default configuration file for Spanish analyzer
##

#### General options 
Lang=es
Locale=default

### Tagset description file, used by different modules
TagsetFile=$FREELINGSHARE/es/tagset.dat

## Traces (deactivated)
TraceLevel=0
TraceModule=0x0000

## Options to control the applied modules. The input may be partially
## processed, or not a full analysis may me wanted. The specific 
## formats are a choice of the main program using the library, as well
## as the responsability of calling only the required modules.
InputLevel=text
OutputLevel=morfo

# Do not consider each newline as a sentence end
AlwaysFlush=no

#### Tokenizer options
TokenizerFile=$FREELINGSHARE/es/tokenizer.dat

#### Splitter options
SplitterFile=$FREELINGSHARE/es/splitter.dat

#### Morfo options
AffixAnalysis=yes
CompoundAnalysis=yes
MultiwordsDetection=yes
NumbersDetection=yes
PunctuationDetection=yes
DatesDetection=yes
QuantitiesDetection=yes
DictionarySearch=yes
ProbabilityAssignment=yes
DecimalPoint=,
ThousandPoint=.
LocutionsFile=$FREELINGSHARE/es/locucions.dat 
QuantitiesFile=$FREELINGSHARE/es/quantities.dat
AffixFile=$FREELINGSHARE/es/afixos.dat
CompoundFile=$FREELINGSHARE/es/compounds.dat
ProbabilityFile=$FREELINGSHARE/es/probabilitats.dat
DictionaryFile=$FREELINGSHARE/es/dicc.src
PunctuationFile=$FREELINGSHARE/common/punct.dat
ProbabilityThreshold=0.001

# NER options 
NERecognition=yes
NPDataFile=$FREELINGSHARE/es/np.dat
## comment line above and uncomment one of those below, if you want 
## a better NE recognizer (higer accuracy, lower speed)
#NPDataFile=$FREELINGSHARE/es/nerc/ner/ner-ab-poor1.dat
#NPDataFile=$FREELINGSHARE/es/nerc/ner/ner-ab-rich.dat
# "rich" model is trained with rich gazetteer. Offers higher accuracy but 
# requires adapting gazetteer files to have high coverage on target corpus.
# "poor1" model is trained with poor gazetteer. Accuracy is splightly lower
# but suffers small accuracy loss the gazetteer has low coverage in target corpus.
# If in doubt, use "poor1" model.

## Phonetic encoding of words.
Phonetics=no
PhoneticsFile=$FREELINGSHARE/es/phonetics.dat

## NEC options. See README in common/nec
NEClassification=no
NECFile=$FREELINGSHARE/es/nerc/nec/nec-ab-poor1.dat
#NECFile=$FREELINGSHARE/es/nerc/nec/nec-ab-rich.dat

## Sense annotation options (none,all,mfs,ukb)
SenseAnnotation=none
SenseConfigFile=$FREELINGSHARE/es/senses.dat
UKBConfigFile=$FREELINGSHARE/es/ukb.dat

#### Tagger options
Tagger=hmm
TaggerHMMFile=$FREELINGSHARE/es/tagger.dat
TaggerRelaxFile=$FREELINGSHARE/es/constr_gram-B.dat
TaggerRelaxMaxIter=500
TaggerRelaxScaleFactor=670.0
TaggerRelaxEpsilon=0.001
TaggerRetokenize=yes
TaggerForceSelect=tagger

#### Parser options
GrammarFile=$FREELINGSHARE/es/chunker/grammar-chunk.dat

#### Dependence Parser options
DependencyParser=txala
DepTxalaFile=$FREELINGSHARE/es/dep_txala/dependences.dat
DepTreelerFile=$FREELINGSHARE/es/dep_treeler/dependences.dat

#### Coreference Solver options
CorefFile=$FREELINGSHARE/es/coref/relaxcor/relaxcor.dat
SemGraphExtractorFile=$FREELINGSHARE/es/semgraph/semgraph-SRL.dat
```

