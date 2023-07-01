var template = $('#section-template').html();
$("#sections-container").append(template);

updateSections();

function updateSections() {
    var items = $(".sections");
    var itemsLength = parseInt(items.length);
    itemsLength = itemsLength - 1;

    items.each(function (index, value) {
        var currentitems = $(value);

        if (index > 0) {
            currentitems.find('.card-title').html("No " + (index));

            currentitems.find('.name-label')
                .attr('for', 'name' + index);
            currentitems.find('.name-input')
                .attr('id', 'name' + index)
                .attr('required', 'true')
                .attr('name', 'names[' + (index - 1) + ']');

            currentitems.find('.description-label')
                .attr('for', 'description' + index);
            currentitems.find('.description-input')
                .attr('id', 'description' + index)
                .attr('name', 'descriptions[' + (index - 1) + ']');
        }

        if (itemsLength == 1) {
            currentitems.find('.remove-button').hide();
        } else {
            currentitems.find('.remove-button').show();
        }
    });
}

function addSection() {
    $("#sections-container").append(template);
    updateSections();
}

function removeSection(currentBlock) {
    var currentBlock = $(currentBlock);
    currentBlock.parent().parent().parent().remove();
    updateSections();
}

// Submit the form
$('#PostForm').submit(function (event) {
    // Remove the first empty section before submitting
    $(".sections").first().remove();
});
