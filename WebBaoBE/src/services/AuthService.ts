import { hashPassword } from "../helpers/helper";
import PrismaService from "./prisma";

const prisma = PrismaService.getInstance()

export const register = async (email:string, password:string) => {
    await prisma.account.create({
        data:{
            email,
            password:await hashPassword(password),
            roleId:2
        }
    })
}

export const login = async (email:string, password:string) => {
    const account = await prisma.account.findFirst({
        where: {
            email,
            password:await hashPassword(password),
        },
        select:{
            accountId: true,
            email: true,
            facebookId: true,
            facebookURL: true,
            roleId: true,
            createdDate: true
        }
    })
}