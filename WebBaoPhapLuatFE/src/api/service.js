import axios from "axios";
import { signIn, signUp, uploadPost } from "./api";

export const getApi = async (url, params = "") => {
  const result = await axios.get(`${url}${params}`);
  return result.data;
};

export const postApi = async (url, data = {}, params = "") => {
  try {
    const result = await axios.post(`${url}${params}`, data);
    return result.data;
  } catch (error) {
    console.log(error.message);
  }
};

export const SignUp = async (data) => {
  await axios.post(signUp, data);
};

export const SignIn = async (data) => {
  const result = await axios.post(signIn, data);
  return result.data;
};

export const delApi = async (url, params = "") => {
  const result = await axios.delete(`${url}${params}`);
  return result.data;
};

export const putApi = async (url, data = {}, params = "") => {
  try {
    const result = await axios.put(`${url}${params}`, data);
    return result.data;
  } catch (error) {
    console.log(error.message);
  }
};

export const addPost = async (file, id) => {
  const headers = {
    "Content-Type": "multipart/form-data",
  };
  await axios.post(uploadPost, { file, id }, { headers });
};
