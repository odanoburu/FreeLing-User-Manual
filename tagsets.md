# FreeLing Tagset Description

FreeLing morphological analyzers and taggser encode morphological information in PoS tags which are based on the proposals by [EAGLES](http://www.ilc.cnr.it/EAGLES96/annotate/node9.html).

 EAGLES intends to be able to encode all existing morphological features for most European languages. 
 
 EAGLES PoS tags consist of a variable-length tag where each character corresponds to a morphological feature.
 First character in the tag is always the category (PoS). The category determines the length of the tag and the interpretation of each character in the tag.
 
 For instance, for category `noun` we could have the definition: 
 
| Position | Atribute | Values |
|:----     |:----     |:----   |
| 0        | category | **N**:_noun_ |
| 1 | type |   **C**:_common_;   **P**:_proper_|
| 2 | gen |   **F**:_f_;   **M**:_m_;   **C**:_c_|
| 3 | num |   **S**:_s_;   **P**:_p_;   **N**:_n_|

That would allow PoS tags such as `NCMS` (standing for _noun-common-masculine-singular_)

Features that are not applicable or underspecified for a particular word are set to `0` (zero). For instance the tag `NC00` stands for _noun/common/underspecified-gender/underspecified-number_.

Note that the interpretation of a character at a certain position of a tag depends on the PoS (indicated by the first character) and on the tagset definition for the target language.

For instance, in a language where nouns can have additional features (e.g. case) the tag definition would include one additional position for case feature. E.g.:

| Position | Atribute | Values |
|:----     |:----     |:----   |
| 0        | category | **N**:_noun_ |
| 1 | type |   **C**:_common_;   **P**:_proper_|
| 2 | case |   **N**:_nominative_;   **G**:_genitive_;   **D**:_dative_;   **F**:_accusative_;  |
| 3 | gen  |   **F**:_f_;   **M**:_m_;   **C**:_c_|
| 4 | num  |   **S**:_s_;   **P**:_p_;   **N**:_n_|



 Next sections contain valid Part-of-Speech tags and attributes with their values for each language supported in FreeLing:

* [(as) Asturian](tagset-as.md)
* [(ca) Catalan](tagset-ca.md)
* [(cy) Welsh](tagset-cy.md)
* [(de) German](tagset-de.md)
* [(en) English](tagset-en.md)
* [(es) Spanish](tagset-es.md)
* [(fr) French](tagset-fr.md)
* [(gl) Galician](tagset-gl.md)
* [(hr) Croatian](tagset-hr.md)
* [(it) Italian](tagset-it.md)
* [(nb) Norwegian](tagset-nb.md)
* [(pt) Portuguese](tagset-pt.md)
* [(ru) Russian](tagset-ru.md)
* [(sl) Slovene](tagset-sl.md)
