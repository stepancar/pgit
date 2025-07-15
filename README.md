# pgit - Parallel Git

A tool for managing parallel git repositories when working on multiple branches simultaneously with Claude or other AI assistants.

## What is pgit?

pgit creates separate working directories for each branch, allowing you to:
- Work on multiple features simultaneously in different IDE sessions
- Avoid constant branch switching and merge conflicts
- Maintain clean separation between different development tasks
- Perfect for AI-assisted development where you might need multiple parallel workstreams

## Installation

### Quick Install

```bash
git clone git@github.com:stepancar/pgit.git
cd pgit
./install.sh
```

That's it! The installer will automatically copy pgit to `/usr/local/bin` and make it executable.

### Manual Installation

If you prefer manual installation:

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd pgit
   ```

2. Add pgit to your PATH by copying it to a directory in your PATH or creating a symlink:
   ```bash
   # Option 1: Copy to /usr/local/bin (requires sudo)
   sudo cp pgit /usr/local/bin/

   # Option 2: Create symlink (adjust path as needed)
   ln -s $(pwd)/pgit /usr/local/bin/pgit

   # Option 3: Add to your shell profile
   echo 'export PATH="$PATH:'$(pwd)'"' >> ~/.bashrc
   # or for zsh:
   echo 'export PATH="$PATH:'$(pwd)'"' >> ~/.zshrc
   ```

3. Make sure the script is executable:
   ```bash
   chmod +x pgit
   ```

## Configuration

By default, pgit creates parallel repositories in the system temp directory (`$TMPDIR/parallel_repos` or `/tmp/parallel_repos`). You can customize this by setting the `PARALLEL_REPOS` environment variable:

```bash
export PARALLEL_REPOS="/path/to/your/parallel/repos"
```

Add this to your shell profile to make it permanent.

## Usage

### Create a new parallel branch

From within any git repository, create a new parallel working directory:

```bash
pgit checkout -b feature-branch-name
```

This will:
1. Clone the repository to `$PARALLEL_REPOS/repo-name_feature-branch-name`
2. Create and checkout the new branch
3. Print the path to the new working directory

### List all parallel branches

```bash
pgit branch
```

Shows all parallel repositories and their current branches.

## Example Workflow

1. Start working on a new feature:
   ```bash
   cd ~/projects/my-app
   pgit checkout -b user-authentication
   ```

2. Open the new directory in a separate IDE session:
   ```bash
   code ~/parallel_repos/my-app_user-authentication
   ```

3. Work on another feature in parallel:
   ```bash
   pgit checkout -b payment-integration
   code ~/parallel_repos/my-app_payment-integration
   ```

4. List all your parallel work:
   ```bash
   pgit branch
   ```

## Benefits

- **No branch switching**: Each feature has its own working directory
- **Parallel development**: Work on multiple features simultaneously
- **Clean separation**: No risk of accidentally mixing changes
- **IDE-friendly**: Each directory can have its own IDE session with separate settings
- **AI-friendly**: Perfect for working with Claude or other AI assistants on multiple tasks

## Requirements

- Git
- Bash
- Unix-like environment (Linux, macOS, WSL)

## Notes

- The script uses shallow clones (`--depth 1`) for faster setup
- Remote repositories must be accessible via the same URL used in the original repo
- The script assumes you have either an `upstream` or `origin` remote configured
