const host = "http://localhost:3000"

export const getPosts = `${host}/posts`
export const get_del_edit_PostById = `${getPosts}/`
export const getPostByCate = `${getPosts}/getPostByCate/`
export const getPostByTag = `${getPosts}/getPostByTag/`
export const addTagForPost = `${getPosts}/addTag/`
export const uploadPost = `${getPosts}/upload`

export const getCategories = `${host}/categories`
export const getCategoryById = `${host}/categories/`

export const getTags = `${host}/tags`
export const getTagById = `${host}/tags/`

export const signIn = `${host}/auth/signIn`
export const signUp = `${host}/auth/signUp`