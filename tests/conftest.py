import os
import tempfile
import shutil
import subprocess
import pytest
from pathlib import Path
from unittest.mock import patch


@pytest.fixture
def temp_git_repo():
    """Create a temporary git repository for testing"""
    # Create temporary directory
    temp_dir = tempfile.mkdtemp()
    original_cwd = os.getcwd()
    
    try:
        # Change to temp directory and initialize git repo
        os.chdir(temp_dir)
        
        # Initialize git repo
        subprocess.run(['git', 'init'], check=True, capture_output=True)
        subprocess.run(['git', 'config', 'user.name', 'Test User'], check=True)
        subprocess.run(['git', 'config', 'user.email', 'test@example.com'], check=True)
        
        # Create initial commit
        with open('README.md', 'w') as f:
            f.write('# Test Repository\n')
        subprocess.run(['git', 'add', 'README.md'], check=True)
        subprocess.run(['git', 'commit', '-m', 'Initial commit'], check=True)
        
        yield temp_dir
    finally:
        # Restore original directory
        os.chdir(original_cwd)
        # Clean up
        if os.path.exists(temp_dir):
            shutil.rmtree(temp_dir)


@pytest.fixture
def mock_git_ai(temp_git_repo):
    """Create a GitAI instance for testing"""
    original_cwd = os.getcwd()
    try:
        os.chdir(temp_git_repo)
        from git_ai.core import GitAI
        git_ai = GitAI()
        yield git_ai
    finally:
        os.chdir(original_cwd)