import { hashPassword } from "../helpers/helper";
import PrismaService from "./prisma";

const prisma = PrismaService.getInstance()

export const register = async (email:string, password:string) => {
    await prisma.account.create({
        data:{
            email,
            password: hashPassword(password),
            roleId:3
        }
    })
}

export const login = async (email:string, password:string) => {
    const account = await prisma.account.findFirst({
        where: {
            email,
            password: hashPassword(password),
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
    return account
}