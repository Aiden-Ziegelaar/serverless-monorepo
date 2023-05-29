import { APIGatewayProxyEventV2WithLambdaAuthorizer, Context } from "aws-lambda";
import "@lib/log_init";

export const handler = async ( event: APIGatewayProxyEventV2WithLambdaAuthorizer<{}>, context: Context) => {
    return {
        statusCode: 200,
        body: JSON.stringify({
        message: `The current time is ${new Date().toTimeString()}.`,
        event,
        context
        })
    }
}