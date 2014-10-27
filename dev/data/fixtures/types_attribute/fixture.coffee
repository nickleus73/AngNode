'use strict'

path = require 'path'

fixture_file = path.resolve 'data/fixtures/types_attribute/fixture.json'

data = require fixture_file

for type of data
  for attribute in data[type]
      console.log attribute