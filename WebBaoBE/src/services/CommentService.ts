import { Comment } from "@prisma/client";
import PrismaService from "./prisma";

const prisma = PrismaService.getInstance();

export const getCommentByPostId = async(id:number) => {
    const comments = await prisma.comment.findMany({
        where:{
            postId:id
        },
        include:{
            Account: true
        }
    })
    return comments
}

export const addComment = async(comment:Comment) => {
    await prisma.comment.create({
        data:comment
    })
}

export const deleteComment = async(commentId:number) => {
    await prisma.comment.delete({
        where:{
            commentId
        }
    })
}