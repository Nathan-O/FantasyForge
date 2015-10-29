$(document).ready(function(){
   console.log("Sanity: Maps Show JS File");

   $("#Master").show();

   $("#version-select").on("change", function(e){
      renderSelectedMap(e);
   });
});

var previousSelect;
var currentSelect;

function renderSelectedMap(event){
   console.log("Changed");
   previousSelect = previousSelect || null;
   console.log(previousSelect);
   currentSelect = $( "#version-select option:selected" ).text();

   console.log(currentSelect + " was selected");

   if (previousSelect === null){
      $("#Master").hide();
      $("#" + currentSelect).show();
   } else {
      $("#" + previousSelect).hide();
      $("#" + currentSelect).show();
   }
   previousSelect = currentSelect;
}
