const baseURL = `https://jpro-api.herokuapp.com/`;
console.log(baseURL);
const axiosInstance = axios.create({
  baseURL: baseURL,
  timeout: 5000,
  headers: {
    Authorization: localStorage.getItem("access_token")
      ? "Bearer " + localStorage.getItem("access_token")
      : null,
    "Content-Type": "application/json",
    accept: "application/json",
  },
});

axiosInstance.interceptors.response.use(
  (response) => response,
  (error) => {
    // Prevent infinite loops
    if (error.response.status === 401) {
      // window.location.href = "/logout";
      return Promise.reject(error);
    }

    // specific error handling done elsewhere
    return Promise.reject(error);
  }
);
