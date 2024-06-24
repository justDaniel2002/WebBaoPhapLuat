import { Request, Response } from "express";
import { addComment, deleteComment, getCommentByPostId, getCommentsForManager } from "../services/CommentService";

export const getComments = async(req:Request, res:Response) => {
    const id = req.params.id
    const result = await getCommentByPostId(parseInt(id))
    res.status(200).json(result)
}

export const getAllComments = async(req:Request, res:Response) => {
    const result = await getCommentsForManager()
    res.status(200).json(result)
}

export const commenting = async(req:Request, res:Response) => {
    const comment = req.body
    try {
        await addComment(comment)
        res.status(200).send("Comment successfully")
    } catch (error) {
        res.status(500).send("Comment failed")
    }
}

export const delComment = async(req:Request, res:Response) => {
    const id = req.params.id
    try {
        await deleteComment(parseInt(id))
        res.status(200).send("Delete comment successfully")
    } catch (error) {
        res.status(500).send("Delete comment failed")
    }
}