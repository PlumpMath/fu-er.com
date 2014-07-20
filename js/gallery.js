var gallery_active_name = "";

function gallery_toggle_impl(name, shown, hidden)
{
  var preview = document.getElementById(name + "_preview");
  if(!preview)
  { return; }
  var shown = preview.style.display == "block";

  if(shown)
  {
    preview.style.display = "none";
    var desc = document.getElementById(name + "_desc");
    if(desc)
    { desc.style.display = "none"; }
    for(var i = 1; i < 100; ++i)
    {
      var suffix = "";
      if(i < 10)
      { suffix = "0" + i; }
      else
      { suffix = i; }
      var step = document.getElementById(name + "_step_" + suffix);
      if(!step)
      { break; }
      step.style.display = "none";
    }
  }
  else
  {
    preview.style.display = "block";
    var desc = document.getElementById(name + "_desc");
    if(desc)
    { desc.style.display = "block"; }
    for(var i = 1; i < 100; ++i)
    {
      var suffix = "";
      if(i < 10)
      { suffix = "0" + i; }
      else
      { suffix = i; }
      var step = document.getElementById(name + "_step_" + suffix);
      if(!step)
      { break; }
      step.style.display = "inline-block";
    }
  }
  gallery_active_name = name;
}

function gallery_toggle(name)
{
  gallery_toggle_impl(gallery_active_name);
  gallery_toggle_impl(name);
}
