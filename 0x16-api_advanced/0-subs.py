#!/usr/bin/python3
""" request the total subscribers in a sub reddit """
import requests


def number_of_subscribers(subreddit):
    """ function to get total subscribers

    Args:
        subreddit (string): subreddit queried
    """
    web = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    headers = {'User-Agent': 'MyAPI/0.1'}
    main = requests.get(web,
                        headers=headers)
    if (main.json().get('error') is not None):
        return 0
    else:
        return main.json()['data']['subscribers']
