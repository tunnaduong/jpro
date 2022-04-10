$.ajax({
  url: "/pages/home.html",
  success: function (ajaxData) {
    $("#include-content").html(ajaxData);
  },
});
