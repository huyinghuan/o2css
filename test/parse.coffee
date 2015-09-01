_assert = require 'assert'

o2css = require '../lib/index'

describe('测试', ->
  simple =
    "body":
      left: 23
      right: 45
    "asv":
      left: 23
      right: 45
      position: "absolute"
    "a123":
      left: "2%"
      right: 23

  it.only("Parse Simple JSON", ->

    console.log o2css.parseSimpleJSON(simple)
  )

)