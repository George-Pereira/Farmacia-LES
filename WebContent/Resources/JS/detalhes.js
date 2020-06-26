$(document).on('click', '.qty-plus', function () {
    $(this).prev().val(+$(this).prev().val() + 1);
});
$(document).on('click', '.qty-minus', function () {
    if ($(this).next().val() > 0) $(this).next().val(+$(this).next().val() - 1);
});