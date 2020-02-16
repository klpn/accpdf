function tagBlock(label, el)
  return { pandoc.RawBlock("latex",
      "\\tagstructbegin{tag=" .. label .."}\\tagmcbegin{tag=" .. label .. "}"),
    el,
    pandoc.RawBlock("latex", "\\leavevmode\\tagmcend\\tagstructend") }
end

function tagFigureBlock(alttext, el)
  return { pandoc.RawBlock("latex",
      "\\tagstructbegin{tag=Figure,alttext={" .. alttext .. "}}\\tagmcbegin{tag=Figure}"),
    el,
    pandoc.RawBlock("latex", "\\tagmcend\\tagstructend") }
end

function Para(el)
  if el.c[1].t == "Image" then
    return tagFigureBlock(el.c[1].attributes.alt, el)
  else
    return tagBlock("P", el)
  end
end

function CodeBlock(el)
  return tagBlock("Code", el)
end

function BulletList(el)
  return {pandoc.RawBlock("latex", "\\tagstructbegin{tag=L}"), pandoc.walk_block(el, {
    Plain = function(el)
      return { pandoc.RawBlock("latex",
        "\\tagstructbegin{tag=LI}\\tagstructbegin{tag=LBody}\\tagmcbegin{tag=P}"),
        el,
        pandoc.RawBlock("latex", "\\tagmcend\\tagstructend\\tagstructend")}
    end }),
   pandoc.RawBlock("latex", "\\tagstructend")}
end

OrderedList = BulletList

if FORMAT:match "latex" then
  function Header(el)
    return tagBlock ("H" .. el.level, el)
  end
end

