import { Request, Response } from "express";
import { addManyPosts, getAllPost, readFileExcelPost } from "../services/PostService"
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