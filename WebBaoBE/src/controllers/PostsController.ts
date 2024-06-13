import { Request, Response } from "express";
import { addManyPosts, addPost, addViewPost, deletePost, editPost, getAllPost, getPostByAccountId, getPostByCategory, getPostById, getPostByTag, getPostByTitle, getPostsByInnerTag, readFileExcelPost } from "../services/PostService"
import { Post } from "@prisma/client";

export const getPosts = async (req: Request, res: Response) => {
    const result = await getAllPost()
    res.status(200).json(result);
}

export const getPtById = async (req:Request, res:Response) => {
    const id = req.params.id
    const result = await getPostById(parseInt(id))
    res.status(200).json(result)
}

export const handleExcelFileRequest = async(req: Request, res: Response) => {
    const filePath = req.file?.path;
    const userId = req.body.id;

    if (!filePath) {
        return res.status(400).send('No file uploaded.');
    }

    try {
        let posts:Post[] = await readFileExcelPost(filePath)
        posts = posts.map(p => {p.createdBy = parseInt(userId); return p});
        await addManyPosts(posts);
        
        res.status(200).json(posts)
    } catch (error:any) {
        res.status(500).send(error.message);
    }
}

export const updatePost = async (req:Request, res: Response) => {
    const id = req.params.id
    const post = req.body
    delete post.postId
    delete post.createdBy
    try {
        await editPost(post, parseInt(id))
        res.status(200).send("Update successfully")
    } catch (error:any) {
        res.status(500).send(error.message);
    }
}

export const createPost = async (req:Request, res: Response) => {
    const post = req.body
    delete post.postId
    try {
        await addPost(post)
        res.status(200).send("Add successfully")
    } catch (error:any) {
      
        res.status(500).send(error.message);
    }
}

export const addView = async (req:Request, res: Response) => {
    const view = req.body 
    try {
        await addViewPost(view)
        res.status(200).send("Add successfully")
    } catch (error:any) {
      
        res.status(500).send(error.message);
    }
}
export const delPost = async (req:Request, res: Response) => {
    const id = req.params.id 
    try {
        await deletePost(parseInt(id))
        res.status(200).send("Delete successfully")
    } catch (error:any) {
        res.status(500).send(error.message)
    }
}

export const PostsFilterInnerTag = async (req:Request, res: Response) => {
    const id = req.params.id 
    const result = await getPostsByInnerTag(parseInt(id))
    res.status(200).json(result)
}

export const PostFilterCategory = async (req: Request, res: Response) => {
    const id = req.params.id 
    const result = await getPostByCategory(parseInt(id))
    res.status(200).json(result)
}

export const PostFilterTag = async (req: Request, res: Response) => {
    const id = req.params.id 
    const result = await getPostByTag(parseInt(id))
    res.status(200).json(result)
}

export const SearchPost  = async (req: Request, res: Response) => {
    const search = req.params.search
    const result = await getPostByTitle(search)
    res.status(200).json(result)
}

export const getPostsByAuthor  = async (req: Request, res: Response) => {
    const id = req.params.id
    const result = await getPostByAccountId(parseInt(id))
    res.status(200).json(result)
}