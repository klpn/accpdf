function tagBlock(label, el)
  return { pandoc.RawBlock("latex", "\\tagmcbegin{tag=" .. label .. "}"),
    el,
    pandoc.RawBlock("latex", "\\tagmcend\n") }
end

function Para(el)
  return tagBlock("P", el)
end
