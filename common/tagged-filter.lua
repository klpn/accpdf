function tagBlock(label, el, extratex)
  extratex = extratex or ""
  return { pandoc.RawBlock("latex",
      "\\tagstructbegin{tag=" .. label .."}\\tagmcbegin{tag=" .. label .. "}"),
    el,
    pandoc.RawBlock("latex", "\\leavevmode\\tagmcend\\tagstructend" .. extratex) }
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
    return tagBlock("P", el, "\\par")
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

function DefinitionList(el)
  return {pandoc.RawBlock("latex", "\\tagstructbegin{tag=L}"),
    transformDefs(el),
    pandoc.RawBlock("latex", "\\tagstructend")}
end

function transformDefs(el)
  for i, def in ipairs(el.content) do
    table.insert(el.content[i][1], 1,
      pandoc.RawInline("latex", "\\tagstructbegin{tag=LI}\\tagstructbegin{tag=Lbl}\\tagmcbegin{tag=Lbl}"))
    table.insert(el.content[i][1],
      pandoc.RawInline("latex", "\\tagmcend\\tagstructend"))
    table.insert(el.content[i][2][1], 1,
      pandoc.RawBlock("latex", "\\tagstructbegin{tag=LBody}\\tagmcbegin{tag=P}"))
    table.insert(el.content[i][2][1],
      pandoc.RawBlock("latex", "\\tagmcend\\tagstructend\\tagstructend"))
  end
  return el
end

if FORMAT:match "latex" then
  function Header(el)
    return tagBlock("H" .. el.level, el)
  end
end

