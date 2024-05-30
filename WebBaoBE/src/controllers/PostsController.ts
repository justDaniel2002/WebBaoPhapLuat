import { Request, Response } from "express";
import { addManyPosts, addTagToPost, deletePost, editPost, getAllPost, getPostByCategory, getPostByTag, readFileExcelPost } from "../services/PostService"
import { Post } from "@prisma/client";

export const getPosts = async (req: Request, res: Response) => {
    const result = await getAllPost()
    res.status(200).json(result);
}

export const handleExcelFileRequest = async(req: Request, res: Response) => {
    const filePath = req.file?.path;
    const userId = req.body.id;

    if (!filePath) {
        return res.status(400).send('No file uploaded.');
    }

    try {
        let posts:Post[] = await readFileExcelPost(filePath)
        posts = posts.map(p => p.createdBy = userId);
        await addManyPosts(posts);
        
        res.status(200).json(posts)
    } catch (error:any) {
        res.status(500).send(error.message);
    }
}

export const updatePost = async (req:Request, res: Response) => {
    const id = req.params.id
    const post = req.body
    try {
        const result = await editPost(post, parseInt(id))
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

export const addPostTag = async (req:Request, res: Response) => {
    const tags = req.body
    const id = req.params.id 
    try {
        await addTagToPost(tags, parseInt(id))
        res.status(200).send("Add Tag To Post successfully")
    } catch (error:any) {
        res.status(500).send(error.message)
    }
}

export const PostFilterCategory = async (req: Request, res: Response) => {
    const id = req.params.id 
    const result = getPostByCategory(parseInt(id))
    res.status(200).json(result)
}

export const PostFilterTag = async (req: Request, res: Response) => {
    const id = req.params.id 
    const result = getPostByTag(parseInt(id))
    res.status(200).json(result)
}