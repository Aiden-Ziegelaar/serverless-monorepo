import { APIGatewayProxyEventV2WithLambdaAuthorizer, Context } from "aws-lambda";

export const handler = async ( event: APIGatewayProxyEventV2WithLambdaAuthorizer<{}>, context: Context) => {
    return {
        statusCode: 200,
        body: JSON.stringify({
            message: `hello world`,
        })
    }
}