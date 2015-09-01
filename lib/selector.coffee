#标准标签待补充
_label = ["body"]

exports.isStandardSelector = (selector)->

  #是id ?
  return true if selector.indexOf('#') is 0
  #是class?
  return true if selector.indexOf('.') is 0
  #标签？
  return true if _label.indexOf(selector) isnt -1

  #'label.class' or 'label > xx"?
  eleWithClass = selector.split(".")[0]
  eleWithChildren = selector.split(" ")[0]
  if _label.indexOf(eleWithClass) isnt -1 or _label.indexOf(eleWithChildren) isnt -1
    return true

  return false



