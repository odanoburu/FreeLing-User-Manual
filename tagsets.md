# FreeLing Tagsets Description

FreeLing morphological analyzers and taggser encode morphological information in PoS tags which are based on the proposals by [EAGLES](http://www.ilc.cnr.it/EAGLES96/annotate/node9.html).
 EAGLES intends to be able to encode all existing morphological features for most European languages. 
 Note that attributes which are not relevant or not used in a particular language are either not included in the tagset for that language.
 Present attributes that are underspecified for a fiven word, get 0 (zero) as value.</P>

 For each language supported in FreeLing, the valid Part-of-Speech tags and attributes with their values is detailed below:

../freeling-git/data/as
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">degree<br/>
<strong>A</strong>: <em>augmentative</em><br/>
<strong>D</strong>: <em>diminutive</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>X</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
<strong>C</strong>: <em>yes</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>pastparticiple</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>ratio</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/ca
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
<strong>V</strong>: <em>evaluative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">possessorpers<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">nesubclass<br/>
<strong>0</strong>: <em>0</em><br/>
<strong>P</strong>: <em>0</em><br/>
</td>
<td valign="top">degree<br/>
<strong>V</strong>: <em>evaluative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
<strong>G</strong>: <em>0</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
<strong>C</strong>: <em>yes</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>participle</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/cy
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: particle</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>G</strong>: particle</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
<strong>A</strong>: <em>article</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>V</strong>: <em>verbal</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">degree<br/>
<strong>A</strong>: <em>augmentative</em><br/>
<strong>D</strong>: <em>diminutive</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>X</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
<strong>C</strong>: <em>yes</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>pastparticiple</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>ratio</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/de
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>Q</strong>: <em>qualificative</em><br/>
<strong>P</strong>: <em>predicative</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
<strong>C</strong>: <em>comparative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>definite</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>X</strong>: <em>possessive</em><br/>
<strong>D</strong>: <em>demostrative</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>V</strong>: <em>full</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>M</strong>: <em>modal</em><br/>
</td>
<td valign="top">mood<br/>
<strong>N</strong>: <em>infinitive</em><br/>
<strong>P</strong>: <em>participle</em><br/>
<strong>Z</strong>: <em>zuinf</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>I</strong>: <em>indicative</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>S</strong>: <em>past</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>F</strong>: <em>reflexive</em><br/>
<strong>X</strong>: <em>possessive</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">politeness<br/>
<strong>P</strong>: <em>polite</em><br/>
<strong>F</strong>: <em>familiar</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>G</strong>: <em>general</em><br/>
<strong>N</strong>: <em>negative</em><br/>
<strong>V</strong>: <em>particle</em><br/>
<strong>P</strong>: <em>pronominal</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
<strong>S</strong>: <em>postposition</em><br/>
<strong>C</strong>: <em>circumposition</em><br/>
<strong>Z</strong>: <em>particle</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>S</strong>: <em>subordinating</em><br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>M</strong>: <em>comparative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/en
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/es
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
<strong>V</strong>: <em>evaluative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">possessorpers<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">nesubclass<br/>
<strong>0</strong>: <em>0</em><br/>
<strong>P</strong>: <em>0</em><br/>
</td>
<td valign="top">degree<br/>
<strong>V</strong>: <em>evaluative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
<strong>G</strong>: <em>0</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>participle</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/fr
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
<strong>A</strong>: <em>augmentative</em><br/>
<strong>D</strong>: <em>diminutive</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">nesubclass<br/>
<strong>0</strong>: <em>0</em><br/>
<strong>P</strong>: <em>0</em><br/>
</td>
<td valign="top">degree<br/>
<strong>A</strong>: <em>augmentative</em><br/>
<strong>D</strong>: <em>diminutive</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>X</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
<strong>G</strong>: <em>0</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
<strong>C</strong>: <em>yes</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>participle</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/gl
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">degree<br/>
<strong>A</strong>: <em>augmentative</em><br/>
<strong>D</strong>: <em>diminutive</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>X</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
<strong>C</strong>: <em>yes</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>pastparticiple</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>ratio</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/hr
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">animate<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>O</strong>: <em>modal</em><br/>
<strong>C</strong>: <em>copula</em><br/>
</td>
<td valign="top">vform<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
<strong>P</strong>: <em>participle</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>L</strong>: <em>pluperfect</em><br/>
<strong>A</strong>: <em>aorist</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">voice<br/>
<strong>A</strong>: <em>active</em><br/>
<strong>P</strong>: <em>passive</em><br/>
</td>
<td valign="top">negative<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>F</strong>: <em>qualificative</em><br/>
<strong>S</strong>: <em>possessive</em><br/>
<strong>O</strong>: <em>ordinal</em><br/>
</td>
<td valign="top">degree<br/>
<strong>P</strong>: <em>positive</em><br/>
<strong>C</strong>: <em>comparative</em><br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">definite<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
<td valign="top">animate<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>S</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>X</strong>: <em>reflexive</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">definite<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">possessorgen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">clitic<br/>
<strong>Y</strong>: <em>yes</em><br/>
<strong>N</strong>: <em>no</em><br/>
</td>
<td valign="top">referent<br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>S</strong>: <em>possessive</em><br/>
</td>
<td valign="top">syntactic<br/>
<strong>N</strong>: <em>nominal</em><br/>
<strong>A</strong>: <em>adjectival</em><br/>
</td>
<td valign="top">animate<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>G</strong>: <em>general</em><br/>
</td>
<td valign="top">degree<br/>
<strong>P</strong>: <em>positive</em><br/>
<strong>C</strong>: <em>comparative</em><br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">formation<br/>
<strong>S</strong>: <em>simple</em><br/>
<strong>C</strong>: <em>compound</em><br/>
</td>
<td valign="top">case<br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
<td valign="top">formation<br/>
<strong>S</strong>: <em>simple</em><br/>
<strong>C</strong>: <em>compound</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: numeral</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>M</strong>: numeral</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>cardinal</em><br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>M</strong>: <em>multiple</em><br/>
<strong>S</strong>: <em>special</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">form<br/>
<strong>D</strong>: <em>digit</em><br/>
<strong>R</strong>: <em>roman</em><br/>
<strong>L</strong>: <em>letter</em><br/>
</td>
<td valign="top">animate<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: particle</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Q</strong>: particle</td>
<td valign="top">type<br/>
<strong>Z</strong>: <em>negative</em><br/>
<strong>Q</strong>: <em>interrogative</em><br/>
<strong>O</strong>: <em>modal</em><br/>
<strong>R</strong>: <em>affirmative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
<td valign="top">formation<br/>
<strong>S</strong>: <em>simple</em><br/>
<strong>C</strong>: <em>compound</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: abbreviation</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Y</strong>: abbreviation</td>
<td valign="top">syntactic<br/>
<strong>N</strong>: <em>nominal</em><br/>
<strong>A</strong>: <em>adjectival</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>D</strong>: <em>d</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: residual</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>X</strong>: residual</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>

../freeling-git/data/it
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">possessorpers<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">degree<br/>
<strong>A</strong>: <em>augmentative</em><br/>
<strong>D</strong>: <em>diminutive</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>R</strong>: <em>relative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
<strong>C</strong>: <em>yes</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>pastparticiple</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>ratio</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/nb
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
<strong>A</strong>: <em>comparative</em><br/>
<strong>P</strong>: <em>positive</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">function<br/>
<strong>P</strong>: <em>participle</em><br/>
<strong>R</strong>: <em>preparticiple</em><br/>
</td>
<td valign="top">case<br/>
<strong>G</strong>: <em>genitive</em><br/>
</td>
<td valign="top">definite<br/>
<strong>D</strong>: <em>yes</em><br/>
<strong>U</strong>: <em>no</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
<strong>A</strong>: <em>adverbial</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>M</strong>: <em>amplifier</em><br/>
<strong>Q</strong>: <em>quantifier</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">definite<br/>
<strong>D</strong>: <em>yes</em><br/>
<strong>U</strong>: <em>no</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>polite</em><br/>
<strong>R</strong>: <em>reciprocal</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">nesubclass<br/>
<strong>0</strong>: <em>0</em><br/>
<strong>P</strong>: <em>0</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
</td>
<td valign="top">definite<br/>
<strong>D</strong>: <em>yes</em><br/>
<strong>U</strong>: <em>no</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>Q</strong>: <em>quantifier</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>X</strong>: <em>possessive</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>C</strong>: <em>reciprocal</em><br/>
<strong>F</strong>: <em>reflexive</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
<td valign="top">human<br/>
<strong>H</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
<strong>G</strong>: <em>0</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
<strong>V</strong>: <em>sverb</em><br/>
<strong>P</strong>: <em>passive</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>participle</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>S</strong>: <em>past</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/pt
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>Q</strong>: <em>qualificative</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">degree<br/>
<strong>S</strong>: <em>superlative</em><br/>
<strong>V</strong>: <em>evaluative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">possessorpers<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: determiner</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: determiner</td>
<td valign="top">type<br/>
<strong>A</strong>: <em>article</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>possessive</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
<td valign="top">nesubclass<br/>
<strong>0</strong>: <em>0</em><br/>
<strong>P</strong>: <em>0</em><br/>
</td>
<td valign="top">degree<br/>
<strong>A</strong>: <em>augmentative</em><br/>
<strong>D</strong>: <em>diminutive</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>E</strong>: <em>exclamative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>T</strong>: <em>interrogative</em><br/>
<strong>N</strong>: <em>numeral</em><br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>R</strong>: <em>relative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
<strong>N</strong>: <em>c</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>O</strong>: <em>oblique</em><br/>
</td>
<td valign="top">polite<br/>
<strong>P</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>N</strong>: <em>negative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: adposition</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>preposition</em><br/>
</td>
<td valign="top">contracted<br/>
<strong>S</strong>: <em>0</em><br/>
<strong>C</strong>: <em>yes</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
<strong>S</strong>: <em>semiauxiliary</em><br/>
</td>
<td valign="top">mood<br/>
<strong>I</strong>: <em>indicative</em><br/>
<strong>S</strong>: <em>subjunctive</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
<strong>P</strong>: <em>pastparticiple</em><br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>N</strong>: <em>infinitive</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>I</strong>: <em>imperfect</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>F</strong>: <em>f</em><br/>
<strong>M</strong>: <em>m</em><br/>
<strong>C</strong>: <em>c</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>ratio</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/ru
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>F</strong>: <em>accusative</em><br/>
<strong>C</strong>: <em>instrumental</em><br/>
<strong>O</strong>: <em>prepositional</em><br/>
<strong>P</strong>: <em>partitive</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">animate<br/>
<strong>A</strong>: <em>yes</em><br/>
<strong>I</strong>: <em>no</em><br/>
</td>
<td valign="top">form<br/>
<strong>F</strong>: <em>full</em><br/>
<strong>S</strong>: <em>short</em><br/>
</td>
<td valign="top">degree<br/>
<strong>E</strong>: <em>superlative</em><br/>
<strong>C</strong>: <em>comparative</em><br/>
<strong>P</strong>: <em>positive</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
<td valign="top">obscene<br/>
<strong>H</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: preposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>B</strong>: preposition</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>D</strong>: adverb</td>
<td valign="top">degree<br/>
<strong>E</strong>: <em>superlative</em><br/>
<strong>C</strong>: <em>comparative</em><br/>
<strong>P</strong>: <em>positive</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
<td valign="top">obscene<br/>
<strong>H</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>E</strong>: pronoun</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>F</strong>: <em>accusative</em><br/>
<strong>C</strong>: <em>instrumental</em><br/>
<strong>O</strong>: <em>prepositional</em><br/>
<strong>P</strong>: <em>partitive</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">animate<br/>
<strong>A</strong>: <em>yes</em><br/>
<strong>I</strong>: <em>no</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>J</strong>: interjection</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
<td valign="top">obscene<br/>
<strong>H</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: compound</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>M</strong>: compound</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>F</strong>: <em>accusative</em><br/>
<strong>C</strong>: <em>instrumental</em><br/>
<strong>O</strong>: <em>prepositional</em><br/>
<strong>P</strong>: <em>partitive</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">animate<br/>
<strong>A</strong>: <em>yes</em><br/>
<strong>I</strong>: <em>no</em><br/>
</td>
<td valign="top">info<br/>
<strong>G</strong>: <em>geographical</em><br/>
<strong>N</strong>: <em>name</em><br/>
<strong>S</strong>: <em>patronymic</em><br/>
<strong>F</strong>: <em>surname</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
<td valign="top">obscene<br/>
<strong>H</strong>: <em>yes</em><br/>
</td>
<td valign="top">neclass<br/>
<strong>S</strong>: <em>person</em><br/>
<strong>G</strong>: <em>location</em><br/>
<strong>O</strong>: <em>organization</em><br/>
<strong>V</strong>: <em>other</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronominal-adv</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronominal-adv</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: participle</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Q</strong>: participle</td>
<td valign="top">mood<br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>I</strong>: <em>infinitive</em><br/>
<strong>D</strong>: <em>indicative</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">aspect<br/>
<strong>F</strong>: <em>perfective</em><br/>
<strong>N</strong>: <em>imperfective</em><br/>
</td>
<td valign="top">voice<br/>
<strong>A</strong>: <em>active</em><br/>
<strong>P</strong>: <em>passive</em><br/>
</td>
<td valign="top">transitive<br/>
<strong>M</strong>: <em>yes</em><br/>
<strong>A</strong>: <em>no</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
<td valign="top">obscene<br/>
<strong>H</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronominal-adj</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: pronominal-adj</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>F</strong>: <em>accusative</em><br/>
<strong>C</strong>: <em>instrumental</em><br/>
<strong>O</strong>: <em>prepositional</em><br/>
<strong>P</strong>: <em>partitive</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">animate<br/>
<strong>A</strong>: <em>yes</em><br/>
<strong>I</strong>: <em>no</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: particle</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>T</strong>: particle</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">mood<br/>
<strong>G</strong>: <em>gerund</em><br/>
<strong>I</strong>: <em>infinitive</em><br/>
<strong>D</strong>: <em>indicative</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">tense<br/>
<strong>P</strong>: <em>present</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>S</strong>: <em>past</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">aspect<br/>
<strong>F</strong>: <em>perfective</em><br/>
<strong>N</strong>: <em>imperfective</em><br/>
</td>
<td valign="top">voice<br/>
<strong>A</strong>: <em>active</em><br/>
<strong>P</strong>: <em>passive</em><br/>
</td>
<td valign="top">transitive<br/>
<strong>M</strong>: <em>yes</em><br/>
<strong>A</strong>: <em>no</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
<td valign="top">obscene<br/>
<strong>H</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: ordinal</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Y</strong>: ordinal</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>F</strong>: <em>accusative</em><br/>
<strong>C</strong>: <em>instrumental</em><br/>
<strong>O</strong>: <em>prepositional</em><br/>
<strong>P</strong>: <em>partitive</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">animate<br/>
<strong>A</strong>: <em>yes</em><br/>
<strong>I</strong>: <em>no</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>F</strong>: <em>accusative</em><br/>
<strong>C</strong>: <em>instrumental</em><br/>
<strong>O</strong>: <em>prepositional</em><br/>
<strong>P</strong>: <em>partitive</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>V</strong>: <em>vocative</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>singular</em><br/>
<strong>P</strong>: <em>plural</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
<strong>C</strong>: <em>c</em><br/>
</td>
<td valign="top">animate<br/>
<strong>A</strong>: <em>yes</em><br/>
<strong>I</strong>: <em>no</em><br/>
</td>
<td valign="top">other<br/>
<strong>P</strong>: <em>transition</em><br/>
<strong>D</strong>: <em>difficult</em><br/>
<strong>V</strong>: <em>corrupted</em><br/>
<strong>R</strong>: <em>predicative</em><br/>
<strong>I</strong>: <em>spoken</em><br/>
<strong>A</strong>: <em>uncommon</em><br/>
<strong>B</strong>: <em>abbreviation</em><br/>
<strong>E</strong>: <em>outdated</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>

../freeling-git/data/sl
<h3>Part of Speech: noun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>N</strong>: noun</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>common</em><br/>
<strong>P</strong>: <em>proper</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>D</strong>: <em>d</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">animate<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: verb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>V</strong>: verb</td>
<td valign="top">type<br/>
<strong>M</strong>: <em>main</em><br/>
<strong>A</strong>: <em>auxiliary</em><br/>
</td>
<td valign="top">aspect<br/>
<strong>E</strong>: <em>perfective</em><br/>
<strong>P</strong>: <em>progressive</em><br/>
<strong>B</strong>: <em>biaspectual</em><br/>
</td>
<td valign="top">vform<br/>
<strong>N</strong>: <em>infinitive</em><br/>
<strong>U</strong>: <em>supine</em><br/>
<strong>P</strong>: <em>participle</em><br/>
<strong>R</strong>: <em>present</em><br/>
<strong>F</strong>: <em>future</em><br/>
<strong>C</strong>: <em>conditional</em><br/>
<strong>M</strong>: <em>imperative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>D</strong>: <em>d</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">negative<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adjective</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>A</strong>: adjective</td>
<td valign="top">type<br/>
<strong>G</strong>: <em>general</em><br/>
<strong>S</strong>: <em>possessive</em><br/>
<strong>P</strong>: <em>participle</em><br/>
</td>
<td valign="top">degree<br/>
<strong>P</strong>: <em>positive</em><br/>
<strong>C</strong>: <em>comparative</em><br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>D</strong>: <em>d</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">definite<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: adverb</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>R</strong>: adverb</td>
<td valign="top">type<br/>
<strong>G</strong>: <em>general</em><br/>
<strong>R</strong>: <em>participle</em><br/>
</td>
<td valign="top">degree<br/>
<strong>P</strong>: <em>positive</em><br/>
<strong>C</strong>: <em>comparative</em><br/>
<strong>S</strong>: <em>superlative</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: pronoun</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>P</strong>: pronoun</td>
<td valign="top">type<br/>
<strong>P</strong>: <em>personal</em><br/>
<strong>S</strong>: <em>possessive</em><br/>
<strong>D</strong>: <em>demonstrative</em><br/>
<strong>R</strong>: <em>relative</em><br/>
<strong>X</strong>: <em>reflexive</em><br/>
<strong>C</strong>: <em>General</em><br/>
<strong>Q</strong>: <em>interrogative</em><br/>
<strong>I</strong>: <em>indefinite</em><br/>
<strong>Z</strong>: <em>negative</em><br/>
</td>
<td valign="top">person<br/>
<strong>1</strong>: <em>1</em><br/>
<strong>2</strong>: <em>2</em><br/>
<strong>3</strong>: <em>3</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>D</strong>: <em>d</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">possessornum<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>D</strong>: <em>d</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">possessorgen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">clitic<br/>
<strong>Y</strong>: <em>yes</em><br/>
<strong>B</strong>: <em>bound</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>M</strong>: number</td>
<td valign="top">form<br/>
<strong>D</strong>: <em>digit</em><br/>
<strong>R</strong>: <em>roman</em><br/>
<strong>L</strong>: <em>letter</em><br/>
</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>cardinal</em><br/>
<strong>O</strong>: <em>ordinal</em><br/>
<strong>P</strong>: <em>pronomial</em><br/>
<strong>S</strong>: <em>special</em><br/>
</td>
<td valign="top">gen<br/>
<strong>M</strong>: <em>m</em><br/>
<strong>F</strong>: <em>f</em><br/>
<strong>N</strong>: <em>n</em><br/>
</td>
<td valign="top">num<br/>
<strong>S</strong>: <em>s</em><br/>
<strong>D</strong>: <em>d</em><br/>
<strong>P</strong>: <em>p</em><br/>
</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
<td valign="top">definite<br/>
<strong>N</strong>: <em>no</em><br/>
<strong>Y</strong>: <em>yes</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: preposition</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>S</strong>: preposition</td>
<td valign="top">case<br/>
<strong>N</strong>: <em>nominative</em><br/>
<strong>G</strong>: <em>genitive</em><br/>
<strong>D</strong>: <em>dative</em><br/>
<strong>A</strong>: <em>accusative</em><br/>
<strong>L</strong>: <em>locative</em><br/>
<strong>I</strong>: <em>instrumental</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: conjunction</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>C</strong>: conjunction</td>
<td valign="top">type<br/>
<strong>C</strong>: <em>coordinating</em><br/>
<strong>S</strong>: <em>subordinating</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: particle</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Q</strong>: particle</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: interjection</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>I</strong>: interjection</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: abbreviation</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Y</strong>: abbreviation</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: residual</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>X</strong>: residual</td>
<td valign="top">type<br/>
<strong>F</strong>: <em>foreign</em><br/>
<strong>T</strong>: <em>typo</em><br/>
<strong>P</strong>: <em>program</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: number</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>Z</strong>: number</td>
<td valign="top">type<br/>
<strong>d</strong>: <em>partitive</em><br/>
<strong>m</strong>: <em>currency</em><br/>
<strong>p</strong>: <em>percentage</em><br/>
<strong>u</strong>: <em>unit</em><br/>
</td>
</tr>
</tbody>
</table>
<h3>Part of Speech: date</h3>
<table>
<tbody>
<tr>
<td valign="top">Category<br/><strong>W</strong>: date</td>
</tr>
</tbody>
</table>

