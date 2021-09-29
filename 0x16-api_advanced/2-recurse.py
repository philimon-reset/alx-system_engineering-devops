#!/usr/bin/python3
""" returns a list containing the titles of all hot articles """
import requests


def recurse(subreddit, hot_list=[]):
    """ function to get top hot posts

    Args:
        subreddit (string): subreddit queried
    """
    web = 'https://www.reddit.com/r/{}/top.json?limit=10'.format(subreddit)
    headers = {'User-Agent': 'MyAPI/0.1'}
    main = requests.get(web,
                        headers=headers)
    if (len(hot_list) < 10):
        hot_list.append(main.json()['data']['children'][len(hot_list)]['data']['title'])
        recurse(subreddit, hot_list)
    else:
        return hot_list
