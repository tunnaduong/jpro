const url_route = {
  "/*": "/utils/profile_common.html",
  head: "/includes/head.html",
  menu: "/includes/menu.html",
  script: "/includes/script.html",
  404: "/pages/errors/404.html",
  "/": "/pages/home.html",
  "/discussions": "/pages/discuss.html",
  "/discussions/*/details": "/pages/discussion_detail.html",
  "/techtalk": "/pages/event.html",
  "/techtalk/*/details": "/pages/event_detail.html",
  "/*/profile": "/utils/profile_common.html",
  "/*/profile/techtalk": "/pages/public_profile_techtalk.html",
  "/myprofile": "/pages/private_profile.html",
  "/myprofile/techtalk": "/pages/private_profile_techtalk.html",
};

const conf = {
  custom_add_syntax: "*",
  debug: true,
};

export {
  url_route,
  conf
};