# FreeLing Tagsets Description

FreeLing morphological analyzers and taggser encode morphological information in PoS tags which are based on the proposals by [EAGLES](http://www.ilc.cnr.it/EAGLES96/annotate/node9.html).
 EAGLES intends to be able to encode all existing morphological features for most European languages. 
 Note that attributes which are not relevant or not used in a particular language are either not included in the tagset for that language.
 Present attributes that are underspecified for a fiven word, get 0 (zero) as value.</P>

 For each language supported in FreeLing, the valid Part-of-Speech tags and attributes with their values is detailed below:


../freeling-git/data/as
<table>
<theader><tr><th colspan="5">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>degree<br/>
<strong>A</strong> -- <em>augmentative</em><br/>
<strong>D</strong> -- <em>diminutive</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>X</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
<strong>C</strong> -- <em>yes</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>pastparticiple</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>ratio</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/ca
<table>
<theader><tr><th colspan="7">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
<strong>V</strong> -- <em>evaluative</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>possessorpers<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>nesubclass<br/>
<strong>0</strong> -- <em>0</em><br/>
<strong>P</strong> -- <em>0</em><br/>
</td>
<td>degree<br/>
<strong>V</strong> -- <em>evaluative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
<strong>G</strong> -- <em>0</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
<strong>C</strong> -- <em>yes</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/cy
<table>
<theader><tr><th colspan="5">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: particle
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>G</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>V</strong> -- <em>verbal</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>degree<br/>
<strong>A</strong> -- <em>augmentative</em><br/>
<strong>D</strong> -- <em>diminutive</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>X</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
<strong>C</strong> -- <em>yes</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>pastparticiple</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>ratio</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/de
<table>
<theader><tr><th colspan="6">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
<strong>P</strong> -- <em>predicative</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
<strong>C</strong> -- <em>comparative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>definite</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>X</strong> -- <em>possessive</em><br/>
<strong>D</strong> -- <em>demostrative</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>V</strong> -- <em>full</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>M</strong> -- <em>modal</em><br/>
</td>
<td>mood<br/>
<strong>N</strong> -- <em>infinitive</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
<strong>Z</strong> -- <em>zuinf</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>I</strong> -- <em>indicative</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>S</strong> -- <em>past</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>F</strong> -- <em>reflexive</em><br/>
<strong>X</strong> -- <em>possessive</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>politeness<br/>
<strong>P</strong> -- <em>polite</em><br/>
<strong>F</strong> -- <em>familiar</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>G</strong> -- <em>general</em><br/>
<strong>N</strong> -- <em>negative</em><br/>
<strong>V</strong> -- <em>particle</em><br/>
<strong>P</strong> -- <em>pronominal</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
<strong>S</strong> -- <em>postposition</em><br/>
<strong>C</strong> -- <em>circumposition</em><br/>
<strong>Z</strong> -- <em>particle</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>S</strong> -- <em>subordinating</em><br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>M</strong> -- <em>comparative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/en
<table>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/es
<table>
<theader><tr><th colspan="7">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
<strong>V</strong> -- <em>evaluative</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>possessorpers<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>nesubclass<br/>
<strong>0</strong> -- <em>0</em><br/>
<strong>P</strong> -- <em>0</em><br/>
</td>
<td>degree<br/>
<strong>V</strong> -- <em>evaluative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
<strong>G</strong> -- <em>0</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/fr
<table>
<theader><tr><th colspan="5">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
<strong>A</strong> -- <em>augmentative</em><br/>
<strong>D</strong> -- <em>diminutive</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>nesubclass<br/>
<strong>0</strong> -- <em>0</em><br/>
<strong>P</strong> -- <em>0</em><br/>
</td>
<td>degree<br/>
<strong>A</strong> -- <em>augmentative</em><br/>
<strong>D</strong> -- <em>diminutive</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>X</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
<strong>G</strong> -- <em>0</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
<strong>C</strong> -- <em>yes</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/gl
<table>
<theader><tr><th colspan="5">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>degree<br/>
<strong>A</strong> -- <em>augmentative</em><br/>
<strong>D</strong> -- <em>diminutive</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>X</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
<strong>C</strong> -- <em>yes</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>pastparticiple</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>ratio</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/hr
<table>
<theader><tr><th colspan="6">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>animate<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="9">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>O</strong> -- <em>modal</em><br/>
<strong>C</strong> -- <em>copula</em><br/>
</td>
<td>vform<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>L</strong> -- <em>pluperfect</em><br/>
<strong>A</strong> -- <em>aorist</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>voice<br/>
<strong>A</strong> -- <em>active</em><br/>
<strong>P</strong> -- <em>passive</em><br/>
</td>
<td>negative<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>F</strong> -- <em>qualificative</em><br/>
<strong>S</strong> -- <em>possessive</em><br/>
<strong>O</strong> -- <em>ordinal</em><br/>
</td>
<td>degree<br/>
<strong>P</strong> -- <em>positive</em><br/>
<strong>C</strong> -- <em>comparative</em><br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>definite<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
<td>animate<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="13">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>S</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>X</strong> -- <em>reflexive</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>definite<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>possessorgen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>clitic<br/>
<strong>Y</strong> -- <em>yes</em><br/>
<strong>N</strong> -- <em>no</em><br/>
</td>
<td>referent<br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>S</strong> -- <em>possessive</em><br/>
</td>
<td>syntactic<br/>
<strong>N</strong> -- <em>nominal</em><br/>
<strong>A</strong> -- <em>adjectival</em><br/>
</td>
<td>animate<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="3">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>G</strong> -- <em>general</em><br/>
</td>
<td>degree<br/>
<strong>P</strong> -- <em>positive</em><br/>
<strong>C</strong> -- <em>comparative</em><br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="4">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>formation<br/>
<strong>S</strong> -- <em>simple</em><br/>
<strong>C</strong> -- <em>compound</em><br/>
</td>
<td>case<br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="3">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
<td>formation<br/>
<strong>S</strong> -- <em>simple</em><br/>
<strong>C</strong> -- <em>compound</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: numeral
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>M</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>cardinal</em><br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>M</strong> -- <em>multiple</em><br/>
<strong>S</strong> -- <em>special</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>form<br/>
<strong>D</strong> -- <em>digit</em><br/>
<strong>R</strong> -- <em>roman</em><br/>
<strong>L</strong> -- <em>letter</em><br/>
</td>
<td>animate<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: particle
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Q</strong></td>
<td>type<br/>
<strong>Z</strong> -- <em>negative</em><br/>
<strong>Q</strong> -- <em>interrogative</em><br/>
<strong>O</strong> -- <em>modal</em><br/>
<strong>R</strong> -- <em>affirmative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
<td>formation<br/>
<strong>S</strong> -- <em>simple</em><br/>
<strong>C</strong> -- <em>compound</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: abbreviation
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Y</strong></td>
<td>syntactic<br/>
<strong>N</strong> -- <em>nominal</em><br/>
<strong>A</strong> -- <em>adjectival</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>D</strong> -- <em>d</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: residual
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>X</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/it
<table>
<theader><tr><th colspan="7">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>possessorpers<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>degree<br/>
<strong>A</strong> -- <em>augmentative</em><br/>
<strong>D</strong> -- <em>diminutive</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
<strong>C</strong> -- <em>yes</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>pastparticiple</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>ratio</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/nb
<table>
<theader><tr><th colspan="8">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
<strong>A</strong> -- <em>comparative</em><br/>
<strong>P</strong> -- <em>positive</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>function<br/>
<strong>P</strong> -- <em>participle</em><br/>
<strong>R</strong> -- <em>preparticiple</em><br/>
</td>
<td>case<br/>
<strong>G</strong> -- <em>genitive</em><br/>
</td>
<td>definite<br/>
<strong>D</strong> -- <em>yes</em><br/>
<strong>U</strong> -- <em>no</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
<strong>A</strong> -- <em>adverbial</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>M</strong> -- <em>amplifier</em><br/>
<strong>Q</strong> -- <em>quantifier</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>definite<br/>
<strong>D</strong> -- <em>yes</em><br/>
<strong>U</strong> -- <em>no</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>polite</em><br/>
<strong>R</strong> -- <em>reciprocal</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>nesubclass<br/>
<strong>0</strong> -- <em>0</em><br/>
<strong>P</strong> -- <em>0</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
</td>
<td>definite<br/>
<strong>D</strong> -- <em>yes</em><br/>
<strong>U</strong> -- <em>no</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>Q</strong> -- <em>quantifier</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>X</strong> -- <em>possessive</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>C</strong> -- <em>reciprocal</em><br/>
<strong>F</strong> -- <em>reflexive</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
<td>human<br/>
<strong>H</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
<strong>G</strong> -- <em>0</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="4">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
<strong>V</strong> -- <em>sverb</em><br/>
<strong>P</strong> -- <em>passive</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>S</strong> -- <em>past</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/pt
<table>
<theader><tr><th colspan="7">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>Q</strong> -- <em>qualificative</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>degree<br/>
<strong>S</strong> -- <em>superlative</em><br/>
<strong>V</strong> -- <em>evaluative</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>possessorpers<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: determiner
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>type<br/>
<strong>A</strong> -- <em>article</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>possessive</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
<td>nesubclass<br/>
<strong>0</strong> -- <em>0</em><br/>
<strong>P</strong> -- <em>0</em><br/>
</td>
<td>degree<br/>
<strong>A</strong> -- <em>augmentative</em><br/>
<strong>D</strong> -- <em>diminutive</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>E</strong> -- <em>exclamative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>T</strong> -- <em>interrogative</em><br/>
<strong>N</strong> -- <em>numeral</em><br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
<strong>N</strong> -- <em>c</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>O</strong> -- <em>oblique</em><br/>
</td>
<td>polite<br/>
<strong>P</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>N</strong> -- <em>negative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: adposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>preposition</em><br/>
</td>
<td>contracted<br/>
<strong>S</strong> -- <em>0</em><br/>
<strong>C</strong> -- <em>yes</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
<strong>S</strong> -- <em>semiauxiliary</em><br/>
</td>
<td>mood<br/>
<strong>I</strong> -- <em>indicative</em><br/>
<strong>S</strong> -- <em>subjunctive</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
<strong>P</strong> -- <em>pastparticiple</em><br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>N</strong> -- <em>infinitive</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>I</strong> -- <em>imperfect</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>C</strong> -- <em>c</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>ratio</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/ru
<table>
<theader><tr><th colspan="9">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>F</strong> -- <em>accusative</em><br/>
<strong>C</strong> -- <em>instrumental</em><br/>
<strong>O</strong> -- <em>prepositional</em><br/>
<strong>P</strong> -- <em>partitive</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>animate<br/>
<strong>A</strong> -- <em>yes</em><br/>
<strong>I</strong> -- <em>no</em><br/>
</td>
<td>form<br/>
<strong>F</strong> -- <em>full</em><br/>
<strong>S</strong> -- <em>short</em><br/>
</td>
<td>degree<br/>
<strong>E</strong> -- <em>superlative</em><br/>
<strong>C</strong> -- <em>comparative</em><br/>
<strong>P</strong> -- <em>positive</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
<td>obscene<br/>
<strong>H</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: preposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>B</strong></td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="4">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>D</strong></td>
<td>degree<br/>
<strong>E</strong> -- <em>superlative</em><br/>
<strong>C</strong> -- <em>comparative</em><br/>
<strong>P</strong> -- <em>positive</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
<td>obscene<br/>
<strong>H</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>E</strong></td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>F</strong> -- <em>accusative</em><br/>
<strong>C</strong> -- <em>instrumental</em><br/>
<strong>O</strong> -- <em>prepositional</em><br/>
<strong>P</strong> -- <em>partitive</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>animate<br/>
<strong>A</strong> -- <em>yes</em><br/>
<strong>I</strong> -- <em>no</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="3">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>J</strong></td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
<td>obscene<br/>
<strong>H</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: compound
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>M</strong></td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="10">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>F</strong> -- <em>accusative</em><br/>
<strong>C</strong> -- <em>instrumental</em><br/>
<strong>O</strong> -- <em>prepositional</em><br/>
<strong>P</strong> -- <em>partitive</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>animate<br/>
<strong>A</strong> -- <em>yes</em><br/>
<strong>I</strong> -- <em>no</em><br/>
</td>
<td>info<br/>
<strong>G</strong> -- <em>geographical</em><br/>
<strong>N</strong> -- <em>name</em><br/>
<strong>S</strong> -- <em>patronymic</em><br/>
<strong>F</strong> -- <em>surname</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
<td>obscene<br/>
<strong>H</strong> -- <em>yes</em><br/>
</td>
<td>neclass<br/>
<strong>S</strong> -- <em>person</em><br/>
<strong>G</strong> -- <em>location</em><br/>
<strong>O</strong> -- <em>organization</em><br/>
<strong>V</strong> -- <em>other</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: pronominal-adv
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="11">
Part of Speech: participle
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Q</strong></td>
<td>mood<br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>I</strong> -- <em>infinitive</em><br/>
<strong>D</strong> -- <em>indicative</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>aspect<br/>
<strong>F</strong> -- <em>perfective</em><br/>
<strong>N</strong> -- <em>imperfective</em><br/>
</td>
<td>voice<br/>
<strong>A</strong> -- <em>active</em><br/>
<strong>P</strong> -- <em>passive</em><br/>
</td>
<td>transitive<br/>
<strong>M</strong> -- <em>yes</em><br/>
<strong>A</strong> -- <em>no</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
<td>obscene<br/>
<strong>H</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: pronominal-adj
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>F</strong> -- <em>accusative</em><br/>
<strong>C</strong> -- <em>instrumental</em><br/>
<strong>O</strong> -- <em>prepositional</em><br/>
<strong>P</strong> -- <em>partitive</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>animate<br/>
<strong>A</strong> -- <em>yes</em><br/>
<strong>I</strong> -- <em>no</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: particle
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>T</strong></td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="11">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>mood<br/>
<strong>G</strong> -- <em>gerund</em><br/>
<strong>I</strong> -- <em>infinitive</em><br/>
<strong>D</strong> -- <em>indicative</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>tense<br/>
<strong>P</strong> -- <em>present</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>S</strong> -- <em>past</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>aspect<br/>
<strong>F</strong> -- <em>perfective</em><br/>
<strong>N</strong> -- <em>imperfective</em><br/>
</td>
<td>voice<br/>
<strong>A</strong> -- <em>active</em><br/>
<strong>P</strong> -- <em>passive</em><br/>
</td>
<td>transitive<br/>
<strong>M</strong> -- <em>yes</em><br/>
<strong>A</strong> -- <em>no</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
<td>obscene<br/>
<strong>H</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="5">
Part of Speech: ordinal
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Y</strong></td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>F</strong> -- <em>accusative</em><br/>
<strong>C</strong> -- <em>instrumental</em><br/>
<strong>O</strong> -- <em>prepositional</em><br/>
<strong>P</strong> -- <em>partitive</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>animate<br/>
<strong>A</strong> -- <em>yes</em><br/>
<strong>I</strong> -- <em>no</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="6">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>F</strong> -- <em>accusative</em><br/>
<strong>C</strong> -- <em>instrumental</em><br/>
<strong>O</strong> -- <em>prepositional</em><br/>
<strong>P</strong> -- <em>partitive</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>V</strong> -- <em>vocative</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>singular</em><br/>
<strong>P</strong> -- <em>plural</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
<strong>C</strong> -- <em>c</em><br/>
</td>
<td>animate<br/>
<strong>A</strong> -- <em>yes</em><br/>
<strong>I</strong> -- <em>no</em><br/>
</td>
<td>other<br/>
<strong>P</strong> -- <em>transition</em><br/>
<strong>D</strong> -- <em>difficult</em><br/>
<strong>V</strong> -- <em>corrupted</em><br/>
<strong>R</strong> -- <em>predicative</em><br/>
<strong>I</strong> -- <em>spoken</em><br/>
<strong>A</strong> -- <em>uncommon</em><br/>
<strong>B</strong> -- <em>abbreviation</em><br/>
<strong>E</strong> -- <em>outdated</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
</table>

../freeling-git/data/sl
<table>
<theader><tr><th colspan="6">
Part of Speech: noun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>N</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>common</em><br/>
<strong>P</strong> -- <em>proper</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>D</strong> -- <em>d</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>animate<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="8">
Part of Speech: verb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>V</strong></td>
<td>type<br/>
<strong>M</strong> -- <em>main</em><br/>
<strong>A</strong> -- <em>auxiliary</em><br/>
</td>
<td>aspect<br/>
<strong>E</strong> -- <em>perfective</em><br/>
<strong>P</strong> -- <em>progressive</em><br/>
<strong>B</strong> -- <em>biaspectual</em><br/>
</td>
<td>vform<br/>
<strong>N</strong> -- <em>infinitive</em><br/>
<strong>U</strong> -- <em>supine</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
<strong>R</strong> -- <em>present</em><br/>
<strong>F</strong> -- <em>future</em><br/>
<strong>C</strong> -- <em>conditional</em><br/>
<strong>M</strong> -- <em>imperative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>D</strong> -- <em>d</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>negative<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: adjective
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>A</strong></td>
<td>type<br/>
<strong>G</strong> -- <em>general</em><br/>
<strong>S</strong> -- <em>possessive</em><br/>
<strong>P</strong> -- <em>participle</em><br/>
</td>
<td>degree<br/>
<strong>P</strong> -- <em>positive</em><br/>
<strong>C</strong> -- <em>comparative</em><br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>D</strong> -- <em>d</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>definite<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="3">
Part of Speech: adverb
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>R</strong></td>
<td>type<br/>
<strong>G</strong> -- <em>general</em><br/>
<strong>R</strong> -- <em>participle</em><br/>
</td>
<td>degree<br/>
<strong>P</strong> -- <em>positive</em><br/>
<strong>C</strong> -- <em>comparative</em><br/>
<strong>S</strong> -- <em>superlative</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="9">
Part of Speech: pronoun
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>P</strong></td>
<td>type<br/>
<strong>P</strong> -- <em>personal</em><br/>
<strong>S</strong> -- <em>possessive</em><br/>
<strong>D</strong> -- <em>demonstrative</em><br/>
<strong>R</strong> -- <em>relative</em><br/>
<strong>X</strong> -- <em>reflexive</em><br/>
<strong>C</strong> -- <em>General</em><br/>
<strong>Q</strong> -- <em>interrogative</em><br/>
<strong>I</strong> -- <em>indefinite</em><br/>
<strong>Z</strong> -- <em>negative</em><br/>
</td>
<td>person<br/>
<strong>1</strong> -- <em>1</em><br/>
<strong>2</strong> -- <em>2</em><br/>
<strong>3</strong> -- <em>3</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>D</strong> -- <em>d</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>possessornum<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>D</strong> -- <em>d</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>possessorgen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>clitic<br/>
<strong>Y</strong> -- <em>yes</em><br/>
<strong>B</strong> -- <em>bound</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="7">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>M</strong></td>
<td>form<br/>
<strong>D</strong> -- <em>digit</em><br/>
<strong>R</strong> -- <em>roman</em><br/>
<strong>L</strong> -- <em>letter</em><br/>
</td>
<td>type<br/>
<strong>C</strong> -- <em>cardinal</em><br/>
<strong>O</strong> -- <em>ordinal</em><br/>
<strong>P</strong> -- <em>pronomial</em><br/>
<strong>S</strong> -- <em>special</em><br/>
</td>
<td>gen<br/>
<strong>M</strong> -- <em>m</em><br/>
<strong>F</strong> -- <em>f</em><br/>
<strong>N</strong> -- <em>n</em><br/>
</td>
<td>num<br/>
<strong>S</strong> -- <em>s</em><br/>
<strong>D</strong> -- <em>d</em><br/>
<strong>P</strong> -- <em>p</em><br/>
</td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
<td>definite<br/>
<strong>N</strong> -- <em>no</em><br/>
<strong>Y</strong> -- <em>yes</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: preposition
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>S</strong></td>
<td>case<br/>
<strong>N</strong> -- <em>nominative</em><br/>
<strong>G</strong> -- <em>genitive</em><br/>
<strong>D</strong> -- <em>dative</em><br/>
<strong>A</strong> -- <em>accusative</em><br/>
<strong>L</strong> -- <em>locative</em><br/>
<strong>I</strong> -- <em>instrumental</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: conjunction
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>C</strong></td>
<td>type<br/>
<strong>C</strong> -- <em>coordinating</em><br/>
<strong>S</strong> -- <em>subordinating</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: particle
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Q</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: interjection
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>I</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: abbreviation
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Y</strong></td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: residual
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>X</strong></td>
<td>type<br/>
<strong>F</strong> -- <em>foreign</em><br/>
<strong>T</strong> -- <em>typo</em><br/>
<strong>P</strong> -- <em>program</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="2">
Part of Speech: number
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>Z</strong></td>
<td>type<br/>
<strong>d</strong> -- <em>partitive</em><br/>
<strong>m</strong> -- <em>currency</em><br/>
<strong>p</strong> -- <em>percentage</em><br/>
<strong>u</strong> -- <em>unit</em><br/>
</td>
</tr>
</tbody>
<theader><tr><th colspan="1">
Part of Speech: date
</th></tr></theader>
<tbody>
<tr>
<td>Category<br/><strong>W</strong></td>
</tr>
</tbody>
</table>

