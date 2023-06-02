let allElements = $('.nav-item.mainItem');
const url = window.location.href;
$.each(allElements, function (index, element) {
// getting all the children of parent li
let module = $(element).children();

    // module[0] main item class href ...
    if(url === (module[0].href)){
        $(module[0]).addClass('active');
    }
    else{
        // selecting all the children of ul
        let sections = $(module[1]).children();

        $.each(sections, function (index, section) {
            // li of selected ul
            let li = $(section).children();
            // li.attr('href') will return the clicked
            if (url === li.attr('href')) {
                li.addClass('active');
                li.parent().parent().parent().addClass('menu-open');
                $(module[0]).addClass('active');
            }
        });
    }
});