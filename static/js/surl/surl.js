/*!
Surl.js v0.1.0 | (c) Fatties Software and Tunna Duong 2022 | software.fatties.vn/surl
Surl uses jQuery to function normally. See jquery.org/license for more information.
*/
function surl(data, config) {
  const style =
    "font-weight: bold; font-size: 30px;color: black; text-shadow: 3px 3px 0 rgb(217,31,38) , 6px 6px 0 rgb(226,91,14) , 9px 9px 0 rgb(245,221,8) , 12px 12px 0 rgb(5,148,68) , 15px 15px 0 rgb(2,135,206) , 18px 18px 0 rgb(4,77,145) , 21px 21px 0 rgb(42,21,113)";
  var disable_module_copyright_info = false;
  var debugging = false;
  var custom_add_syntax = "_any_";
  var include_head_element = "#include-head";
  var include_menu_element = "#include-menu";
  var include_content_element = "#include-content";
  var include_script_element = "#include-script";
  if (config) {
    if (config.hasOwnProperty("no_load_info")) {
      var disable_module_copyright_info = config.no_load_info;
    }
    if (config.hasOwnProperty("debug")) {
      var debugging = config.debug;
    }
    if (config.hasOwnProperty("custom_add_syntax")) {
      var custom_add_syntax = config.custom_add_syntax;
    }
    if (config.hasOwnProperty("head")) {
      var include_head_element = config.head;
    }
    if (config.hasOwnProperty("menu")) {
      var include_menu_element = config.menu;
    }
    if (config.hasOwnProperty("content")) {
      var include_content_element = config.content;
    }
    if (config.hasOwnProperty("script")) {
      var include_script_element = config.script;
    }
  } else {
    console.warn(
      'Surl\nWarning: Missing "config" JSON param! Surl won\'t operate normally and will use default configurations if you continue...'
    );
  }
  disable_module_copyright_info == false &&
    console.log(
      "%cSurl.js",
      style,
      '\n\n\nMade with ❤️ by Tunna Duong from Fatties Software\n\nFacebook: https://facebook.com/tunna.duong\nWebsite: https://blog.tunnaduong.com\nFatties Software: https://software.fatties.vn\n\nYayy! Everything is loaded successfully! You should be thankful for that :)\n\nTired of seeing this message? Add "no_load_info: true" in config parameter of Surl function to disable it.'
    );
  if (!data) {
    console.error(
      'Surl\nError: Missing required "data" JSON param! Can\'t operate normally...'
    );
  } else {
    debugging == true &&
      console.log("%c✅ Loaded route JSON data", "background-color: #B7DFB3");
    Object.keys(data).forEach(function (expectedPath) {
      var loadPath = data[expectedPath];
      var matchCount = 0;
      var splitedPath = expectedPath.split("/");
      var splitedRealPath = location.pathname.split("/");

      if (expectedPath == "head") {
        debugging == true && console.log("Now load <head> tag...");
        $.ajax({
          url: loadPath,
          success: function (ajaxData) {
            $(include_head_element).html(ajaxData);
          },
          async: false,
        });
      } else if (expectedPath == "menu") {
        debugging == true && console.log("Now load menu...");
        $.ajax({
          url: loadPath,
          success: function (ajaxData) {
            $(include_menu_element).html(ajaxData);
          },
          async: false,
        });
      } else if (expectedPath == "script") {
        debugging == true && console.log("Now load bottom page scripts...");
        $.ajax({
          url: loadPath,
          success: function (ajaxData) {
            $(include_script_element).html(ajaxData);
          },
          async: false,
        });
      } else if (expectedPath == "500") {
        debugging == true && console.log("Now load 500 page...");
        $.ajax({
          url: loadPath,
          success: function (ajaxData) {
            $(include_content_element).html(ajaxData);
          },
          async: false,
        });
      } else if (expectedPath == "404") {
        debugging == true &&
          console.log(
            "Now load 404 page... If the next URL tries is failed then it will remain and show the 404 page..."
          );
        $.ajax({
          url: loadPath,
          success: function (ajaxData) {
            $(include_content_element).html(ajaxData);
          },
          async: false,
        });
      } else if (expectedPath == "/*") {
        debugging == true && console.log("Now load /* page...");
        $.ajax({
          url: loadPath,
          success: function (ajaxData) {
            $(include_content_element).html(ajaxData);
          },
          async: false,
        });
      } else {
        for (var i = 1; i < splitedPath.length; i++) {
          if (
            splitedPath[i] == custom_add_syntax &&
            splitedRealPath[i] != null
          ) {
            matchCount++;
          } else {
            for (var j = 1; j < splitedRealPath.length; j++) {
              if (
                splitedPath[i] == splitedRealPath[j] &&
                splitedRealPath[i] == splitedPath[i] &&
                splitedPath[i] != custom_add_syntax
              ) {
                matchCount++;
              }
            }
          }
        }

        if (
          matchCount == splitedPath.length - 1 &&
          matchCount == splitedRealPath.length - 1
        ) {
          debugging == true &&
            console.log(
              "Actual match count: " +
                matchCount +
                " matched with expected URL match count: " +
                (splitedPath.length - 1) +
                '. URL is valid. Now loading content from path: "' +
                loadPath +
                '"'
            );
          $.ajax({
            url: loadPath,
            success: function (ajaxData) {
              $(include_content_element).html(ajaxData);
            },
          });
        } else {
          debugging == true &&
            console.warn(
              `Actual match count: ` +
                matchCount +
                ` is different than expected URL match count: ` +
                (splitedPath.length - 1) +
                `. So URL is different or not fully matched expected path: "` +
                expectedPath +
                `". Skipping...`
            );
          $("#page-title").text("Oops, không tìm thấy nội dung - JPro");
          setTimeout(() => {
            $("#404").css("visibility", "visible");
          }, 450);
        }
      }
    });
  }
}

export default surl;
