import PrismaService from "./prisma";

const prisma = PrismaService.getInstance();

export const getAllTags = async () => {
    const tags = prisma.tag.findMany();
    return tags
}

