#!/usr/bin/python3
""" returns a list containing the titles of all hot articles """
import requests


def recurse(subreddit, hot_list=[], afters=""):
    """ function to get top hot posts

    Args:
        subreddit (string): subreddit queried
    """
    web = 'https://www.reddit.com/r/{}/hot.json?after={}'.format(
        subreddit, afters)
    headers = {'User-Agent': 'MyAPI/0.1'}
    main = requests.get(web,
                        headers=headers, allow_redirects=False)
    if (main.json().get('error') == 404):
        return None
    if (afters is not None):
        afters = main.json()['data']['after']
        for post in main.json()['data']['children']:
            hot_list.append(post['data']['title'])
        recurse(subreddit, hot_list, afters)
    return hot_list
