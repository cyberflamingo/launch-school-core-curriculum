=begin

PEDAC
=====

(Understand the) Problem
------------------------

- Inputs:
  1. A file with sentences in English
- Outputs:
  1. The text with its verbs, adjectives and adverb replaced by others

**Problem Domain:**

English

**Implicit Requirements:**

-  The text should have a way to distinguish words to replace
-  Replacement is done line-by-line

**Clarifying Questions:**

1. N/A

**Mental Model:**

Read an external file and, line by line, replace words matching a specific
pattern. Print the result.

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

- Example 1
  - Inputs:
    1. 'The %{adjective} brown %{noun} %{adverb}
        %{verb} the %{adjective} yellow
        %{noun}, who %{adverb} %{verb} his
        %{noun} and looks around.'
  - Outputs:
    1. 'The sleepy brown cat noisily
       licks the sleepy yellow
       dog, who lazily licks his
       tail and looks around.'

Data Structure
--------------

**Your Data Structure:**

An array of strings

Algorithm
---------

**Your Algorith:**

.  Initialize local variable `adjectives`, `nouns`, `verbes` and `adverb` to
array objects with string elements
.  Initialize a local variable `file_lines` assigning a new array object
.  Read the file line by line
  .  Save each line in local variable `file_lines` as strings
.  Iterate over `file_lines`, passing in the `do..end` block
  .  For each line, call `format` to substitue strings matching a certain
     pattern with a random string from `adjectives`, `nouns`, `verbs` and
     `adverb`

Code
----

=end

def madlibs_revisited(file_name)
  adjectives = %w(quick lazy sleepy ugly)
  nouns      = %w(fox dog head leg)
  verbs      = %w(jumps lifts bites licks)
  adverb     = %w(easily lazily noisily excitedly)
  file_lines = Array.new

  File.foreach(file_name) { |line| file_lines << line }

  file_lines.map do |line|
    puts format(line, adjective: adjectives.sample,
                      noun: nouns.sample,
                      verb: verbs.sample,
                      adverb: adverb.sample)
  end
end

madlibs_revisited('brown_cat.txt')
