const Koa = require('koa');
const app = new Koa();
const { PORT = 3030 } = process.env;
const bigPayload = require('../dumps/big_payload');

const Router = require('koa-router');

const router = new Router();

router.get('/', (ctx, next) => {
    ctx.body = {
        message: 'Hello world',
    };
});

router.get('/big', (ctx, next) => {
    ctx.body = bigPayload;
});

app
    .use(router.routes())
    .use(router.allowedMethods());

app.listen(PORT);
console.log(`Koa server is listening on ${PORT} port.`);