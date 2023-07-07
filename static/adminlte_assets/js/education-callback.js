$(document).ready(function() {
    // Hide the remove button for the initial education section
    $('.education-section .remove-education-section').hide();

    // Add education section
    $('.add-education-section').click(function() {
        var section = $('.education-section').first().clone();
        section.find('input').val(''); // Clear input values in the cloned section
        section.find('.remove-education-section').show(); // Show the remove button for the cloned section

        // Update index number
        var index = $('.education-section').length;
        section.find('.section-index').text('Certificate Or Degree No ' + (index + 1));

        section.appendTo('#education-sections');

        // Show the remove button when there is more than one education section
        if (index > 0) {
            $('.education-section .remove-education-section').show();
        }
    });

    // Remove education section
    $(document).on('click', '.remove-education-section', function() {
        if ($('.education-section').length > 1) {
            $(this).closest('.education-section').remove();

            // Update index numbers
            $('.education-section').each(function(index) {
                $(this).find('.section-index').text('Certificate Or Degree No : ' + (index + 1));
            });

            // Hide the remove button when there is only one education section left
            if ($('.education-section').length === 1) {
                $('.education-section .remove-education-section').hide();
            }
        }
    });
});
