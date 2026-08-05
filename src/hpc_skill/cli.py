import argparse
import os
import shutil
import sys
from pathlib import Path

def get_package_skills_dir():
    # The skills directory is located relative to this file
    base_dir = Path(__file__).resolve().parent
    skills_dir = base_dir / "skills"
    if not skills_dir.exists():
        print(f"Error: Could not find packaged skills at {skills_dir}")
        sys.exit(1)
    return skills_dir

def install_skills(project_scoped=False):
    source_dir = get_package_skills_dir()
    
    if project_scoped:
        target_dir = Path(os.getcwd()) / ".agents" / "skills"
    else:
        # For antigravity, global is ~/.gemini/config/skills
        target_dir = Path.home() / ".gemini" / "config" / "skills"
        
    print(f"Installing HPC skills to {target_dir}...")
    
    # Ensure target directory exists
    target_dir.mkdir(parents=True, exist_ok=True)
    
    # Copy all subdirectories from source to target
    copied = 0
    for item in source_dir.iterdir():
        if item.is_dir():
            dest = target_dir / item.name
            if dest.exists():
                print(f"  Replacing {item.name}...")
                shutil.rmtree(dest)
            else:
                print(f"  Adding {item.name}...")
            shutil.copytree(item, dest)
            copied += 1
            
    print(f"\nSuccessfully installed {copied} skills.")
    if project_scoped:
        print("\nHint: You may want to commit the .agents/ directory to your repository.")

def main():
    parser = argparse.ArgumentParser(description="HPC Skill CLI")
    subparsers = parser.add_subparsers(dest="command", help="Available commands")
    
    install_parser = subparsers.add_parser("install", help="Install the HPC skill to your AI assistant")
    install_parser.add_argument("--project", action="store_true", help="Install to current project (.agents) instead of globally")
    
    args = parser.parse_args()
    
    if args.command == "install":
        install_skills(args.project)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
