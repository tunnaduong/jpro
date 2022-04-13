import axiosInstance from "./axiosApi";

async function auth(username, password) {
  try {
    const response = await axiosInstance.post("/api/user/login/", {
      username: username,
      password: password,
    });

    if (response.data.access && response.data.refresh) {
      window.location.href = "/";
      sessionStorage.setItem("access_token", response.data.access);
      sessionStorage.setItem("refresh_token", response.data.refresh);
    }
    console.log("ok");
    return response.data;
  } catch (error) {
    if (error.response) {
      console.log("failed");
      console.log(error.response.data);
    }
  }
}
