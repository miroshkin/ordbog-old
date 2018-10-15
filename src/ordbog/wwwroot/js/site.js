// Write your JavaScript code.
function addSymbolToSearchString(symbol) {
    $('#SearchString').val($('#SearchString').val() + symbol);
    $('#SearchString').focus();
}