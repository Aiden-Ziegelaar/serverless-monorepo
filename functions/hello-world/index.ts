import {
  APIGatewayProxyEventV2WithLambdaAuthorizer,
  Context,
} from "aws-lambda";
import { Client } from 'pg';
const _client = new Client()
const _connect = _client.connect()


export const handler = async (
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  event: APIGatewayProxyEventV2WithLambdaAuthorizer<unknown>,
  // eslint-disable-next-line @typescript-eslint/no-unused-vars
  context: Context
) => {
  await _connect;
  const client = _client;
  const res = await client.query('SELECT $1::text as message', ['Hello world!'])
  return {
    statusCode: 200,
    body: JSON.stringify({
      message: `hello world ${res.rows[0].message}`,
    }),
  };
};
