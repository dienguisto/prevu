// Define the rendering and selecting behaviour for suggestions.
render = function(term, data, type){ return term; }
select = function(term, data, type){ console.log("Selected " + term); }

// Make the input field autosuggest-y.
$('#search-input').soulmate({
    url:            'http://localhost:3000/sm',
    types:          ['integer', 'string'],
    renderCallback: render,
    selectCallback: select,
    minQueryLength: 2,
    maxResults:     5
});