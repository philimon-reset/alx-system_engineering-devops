#!/usr/bin/python3
""" request the top ten hot posts """
import requests

def case(data):
    seen, result = set(), []
    for item in data:
        if item.lower() not in seen:
            seen.add(item.lower())
            result.append(item)
    return result

def count_words(subreddit, word_list, afters="", before="", count={}):
    """ function to get top hot posts

    Args:
    subreddit (string): subreddit queried
"""
    web = 'https://www.reddit.com/r/{}/hot.json?after={}'.format(
        subreddit, afters)
    headers = {'User-Agent': 'MyAPI/0.1'}
    main = requests.get(web,
                        headers=headers, allow_redirects=False)
    before = main.json()['data']['before']
    if (main.status_code == 404):
        return None
    word_l = case(word_list)
    if (before is None and afters is None):
        for C in word_l:
            for post in main.json()['data']['children']:
                hold = [x.lower() for x in post['data']['title'].split()]
                if C in hold:
                    if count.get(C) is None:
                        count[C] = 0
                    count[C] += hold.count(C.lower())
        for words, numbers in count.items():
            print("{}: {}".format(words, numbers))
    elif (afters is not None):
        afters = main.json()['data']['after']
        for C in word_l:
            for post in main.json()['data']['children']:
                hold = [x.lower() for x in post['data']['title'].split()]
                if C in hold:
                    if count.get(C) is None:
                        count[C] = 0
                    count[C] += hold.count(C.lower())
        count_words(subreddit, word_l, afters, count)
    else:
        for words, numbers in count.items():
            print("{}: {}".format(words, numbers))