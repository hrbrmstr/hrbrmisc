// shortcuts (kinda the only reason I use jQuery anyway)
function $id(element) { return(document.getElementById(element)); }
function $tag(tag) { return(document.getElementsByTagName(tag)); }
function $qs(css) { return(document.querySelector(css)) }

HTMLWidgets.widget({

  name: 'jsonview',
  type: 'output',

  initialize: function(el, width, height) { return {} },

  renderValue: function(el, param, instance) {

    var self = this;

    self.thel = el;
    self.glob = {} ;

    self.glob.jsonDocName = param.jsonDocName;
    self.glob.jsonDoc     = param.jsonDoc;
    self.glob.orig        = param.jsonDoc;

    var link = document.createElement("link");
    link.href  = "lib/highlightjs-9.0.0/styles/" +
                 param.styleSheet + ".css";
    link.type  = "text/css";
    link.rel   = "stylesheet";
    link.media = "screen,print";

    $tag("head")[0].appendChild(link);

    if (param.scroll) { el.style.overflow = "scroll" }

    el.innerHTML = '<pre><code class="json jsondiv"></code></pre>';

    self.json_div = $qs("div#" + el.id + " > pre > code.jsondiv");

    self.json_div.innerText = vkbeautify.json(param.jsonDoc);
    self.json_div.textContent = vkbeautify.json(param.jsonDoc);

    hljs.initHighlighting() ;
    hljs.highlightBlock(self.json_div);

  },

  resize: function(el, width, height, instance) {},

});