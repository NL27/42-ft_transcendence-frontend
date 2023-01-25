<script>

    import {onMount} from 'svelte';

    let username = 'username';
    let message = '';
    let messages = [];

    onMount(() => {
        Pusher.logToConsole = true;

        const pusher = new Pusher('1071696b7e5cadb3187d', {
            cluster: 'eu'
        });

        const channel = pusher.subscribe('chat');
        channel.bind('message', data => {
            messages = [...messages, data];
        });
    })

    const submit = async () => {
        await fetch('http://localhost:8000/api/messages', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                username,
                message
            })
        });

        message = '';
    }
</script>

<html class="h-full bg-gray-100">
    <body class="h-full">
        <div class="mx-auto max-w-7xl py-12 px-6 lg:flex lg:items-center lg:justify-between lg:py-16 lg:px-8">
            <h2 class="text-3xl font-bold tracking-tight text-gray-900 sm:text-4xl">
            <span class="block ">TRANSCENDENCE</span>
            <span class="block text-indigo-600">Want to transcend into the void?</span>
            </h2>
            <div class="mt-8 flex lg:mt-0 lg:flex-shrink-0">
            <div class="inline-flex rounded-md shadow">
                <a href="#" class="inline-flex items-center justify-center rounded-md border border-transparent bg-indigo-600 px-5 py-3 text-base font-medium text-white hover:bg-indigo-700">Let's go!</a>
            </div>
            </div>
        </div>
    </body>
</html>

<div class="container">
    <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white">
        <div class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
            <input class="fs-5 fw-semibold" bind:value={username}/>
        </div>
        <div class="list-group list-group-flush border-bottom scrollarea">
            {#each messages as msg}
                <div class="list-group-item list-group-item-action py-3 lh tight">
                    <div class="d-flex w-100 align-items-center justify-content-between">
                        <strong class="mb-1">{msg.username}</strong>
                    </div>
                    <div class="col-10 mb-1 small">{msg.message}</div>
                </div>
            {/each}
        </div>
    </div>
    <form on:submit|preventDefault={submit}>
        <input class="form-control" placeholder="Write a message" bind:value={message}/>
    </form>
</div>

<style>
    .scrollarea {
        min-height: 500px
    }
</style>
