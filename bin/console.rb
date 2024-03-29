#!/usr/bin/env ruby

require 'irb'

require_relative '../lib/family.rb'
require_relative '../lib/family_tree.rb'
require_relative '../lib/gender.rb'
require_relative '../lib/relation.rb'
require_relative '../lib/person.rb'
require_relative '../lib/command.rb'
require_relative '../lib/utils.rb'

require_relative '../lib/command/add.rb'
require_relative '../lib/command/relation.rb'
require_relative '../lib/command/search.rb'

require_relative '../lib/utils/console.rb'
require_relative '../lib/utils/parser.rb'
require_relative '../lib/utils/message.rb'

require_relative '../lib/relation/father.rb'
require_relative '../lib/relation/mother.rb'
require_relative '../lib/relation/child.rb'
require_relative '../lib/relation/sibling.rb'
require_relative '../lib/relation/brother.rb'
require_relative '../lib/relation/sister.rb'
require_relative '../lib/relation/daughter.rb'
require_relative '../lib/relation/son.rb'

require_relative '../lib/string.rb'

IRB.start
