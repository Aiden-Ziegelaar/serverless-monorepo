import {
  APIGatewayProxyEventV2WithLambdaAuthorizer,
  Context,
} from "aws-lambda";

export const handler = async (
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  event: APIGatewayProxyEventV2WithLambdaAuthorizer<unknown>,
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  context: Context
) => {
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: `hello world`,
    }),
  };
};
