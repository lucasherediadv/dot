"""
Check if a password has been compromised in data breaches using the
Have I Been Pwned API.

Usage:
    python pwned.py <password>

Args:
    password (str): The password to check.

Returns:
    Prints a message indicating whether the password is compromised
    or not.

Note:
    - The API only returns hash prefixes, not full hashes, for
    security reasons.
    - The script does not send the actual password to the API, only
    its hash prefix is used.
"""

import requests
import hashlib
import argparse


def main():
    parser = argparse.ArgumentParser(description="Check if a password has been compromised in data breaches.")
    parser.add_argument("password", help="The password to check")
    args = parser.parse_args()

    password = args.password
    hashed_password = hashlib.sha1(password.encode()).hexdigest()
    prefix = hashed_password[:5].upper()

    url = f"https://api.pwnedpasswords.com/range/{prefix}"

    try:
        response = requests.get(url)
        response.raise_for_status()
    except requests.RequestException as e:
        print(f"Error fetching data: {e}")
        return

    body = response.text

    suffix = hashed_password[5:].upper()
    found = suffix in body

    if found:
        print("Warning: this password has been compromised in data breaches.")
    else:
        print("Good news: password is not compromised.")


if __name__ == "__main__":
    main()

