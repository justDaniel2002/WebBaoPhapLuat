const host = "http://localhost:3000"

export const getPosts = `${host}/posts`
export const get_del_edit_PostById = `${getPosts}/`
export const getPostByCate = `${getPosts}/getPostByCate/`
export const getPostByTag = `${getPosts}/getPostByTag/`
export const getPostByInnerTag = `${getPosts}/getPostByInnerTag/`
export const uploadPost = `${getPosts}/upload`
export const searchPost = `${getPosts}/search/`
export const getPostsByAuthor = `${getPosts}/author/`

export const getCategories = `${host}/categories`
export const getCategoryById = `${host}/categories/`

export const getTags = `${host}/tags`
export const getTagById = `${host}/tags/`
export const getInnerTagById = `${host}/tags/innerTag/`

export const getComments = `${host}/comments`
export const get_del_comment = `${host}/comments/`
export const addComment = `${host}/comments/add`

export const signIn = `${host}/auth/signIn`
export const signUp = `${host}/auth/signUp`